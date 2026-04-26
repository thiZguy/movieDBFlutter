# TMDB App — Flutter Technical Test (Equifax)

App móvil en Flutter que consume la API pública de [The Movie Database (TMDB)](https://www.themoviedb.org/) para listar películas y series ordenadas por popularidad y evaluación, ver sus detalles, y buscarlas por nombre.

## Stack

| Área | Librería |
|------|----------|
| State management + DI | [`flutter_riverpod`](https://pub.dev/packages/flutter_riverpod) |
| HTTP client | [`dio`](https://pub.dev/packages/dio) (con interceptors de auth y logging) |
| Modelos inmutables + JSON | [`freezed`](https://pub.dev/packages/freezed) + [`json_serializable`](https://pub.dev/packages/json_serializable) |
| Routing | [`go_router`](https://pub.dev/packages/go_router) |
| Imágenes con cache | [`cached_network_image`](https://pub.dev/packages/cached_network_image) |
| Variables de entorno | [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) |
| Testing | [`mocktail`](https://pub.dev/packages/mocktail) |

Ver `INTERVIEW_CHEATSHEET.md` para la justificación detallada de cada elección y los trade-offs considerados.

## Cómo correr la app

### 1. Requisitos

- Flutter 3.41 o superior (`flutter --version`)
- Dart 3.11 o superior
- Android Studio / Xcode con un emulador o dispositivo físico

### 2. Configurar la API key de TMDB

Crear cuenta gratuita en [themoviedb.org](https://www.themoviedb.org/signup) y obtener el **v4 Read Access Token** en https://www.themoviedb.org/settings/api.

Copiar `.env.example` a `.env` y completar:

```env
TMDB_BEARER_TOKEN=eyJhbGciOiJIUzI1NiJ9...
TMDB_BASE_URL=https://api.themoviedb.org/3
TMDB_IMAGE_BASE_URL=https://image.tmdb.org/t/p
```

> El archivo `.env` está en `.gitignore` y NO se commitea. `.env.example` queda como referencia para colaboradores.

### 3. Instalar dependencias y generar código

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

El `build_runner` genera los archivos `.freezed.dart` y `.g.dart` para los modelos.

### 4. Correr la app

```bash
flutter run
```

### 5. Tests

```bash
flutter test
```

## Arquitectura

**Clean Architecture light, organizada por feature.** Cada feature tiene tres capas (`data` / `domain` / `presentation`) que separan reglas de negocio del framework y de la fuente de datos.

```
lib/
├── core/                       Configuración compartida
│   ├── config/                 AppConfig (lectura de .env)
│   ├── network/                Dio, interceptors, mapper de errores
│   ├── error/                  Excepciones de dominio
│   ├── router/                 GoRouter
│   └── theme/                  ThemeData
├── features/
│   ├── movies/
│   │   ├── data/               DTOs (con freezed/json), datasource, repository impl
│   │   ├── domain/             Entidad Movie, repository abstracto, usecases
│   │   └── presentation/       Providers Riverpod, páginas, widgets
│   ├── tv_shows/               (espejo simétrico de movies)
│   ├── search/                 Datasource y providers reusan modelos de movies/tv_shows
│   └── home/                   Scaffold con TabBar
└── shared/
    └── widgets/                PosterImage, RatingBadge, ErrorView, LoadingGrid
```

**Flujo de datos para una request típica:**

```
UI (MoviesPage)
  → ref.watch(moviesByCategoryProvider)
    → GetPopularMovies usecase
      → MoviesRepository.getPopular()  [domain]
        → MoviesRepositoryImpl  [data]
          → MoviesRemoteDataSource.getPopular()
            → DioClient.get('/movie/popular')
              ← MovieDto.fromJson()
            ← List<MovieDto>
          ← List<MovieDto> mapeado a List<Movie> (entity)
        ← List<Movie>
      ← List<Movie>
    ← AsyncValue<List<Movie>>
  ← UI rendea con .when(loading, error, data)
```

### Decisiones que vale la pena justificar

- **Excepciones tipadas vs `Either<Failure, T>`**: la capa `data` lanza `NetworkException`, `ServerException`, etc. (ver `core/error/exceptions.dart`). Riverpod las captura naturalmente en `AsyncError`. Evita una dependencia (`dartz`) y boilerplate sin perder tipado.
- **DTOs separados de entidades**: `MovieDto` (en `data/models`) conoce el JSON crudo de TMDB. `Movie` (en `domain/entities`) es la entidad limpia. Si TMDB cambia su schema, solo se modifica el mapper.
- **Mismo enum `popular | topRated` por feature** (en lugar de un enum global): mantiene los features desacoplados. Si en el futuro movies agrega "now playing" pero TV no, no hay coupling.
- **Sin paginación**: el PDF dice explícitamente que no es necesaria. La sección "Mejoras pendientes" describe cómo se implementaría.
- **Code-gen committed al repo**: los archivos `.freezed.dart` y `.g.dart` se commitean para que `flutter run` funcione directo, sin obligar al evaluador a correr `build_runner`. Decisión consciente; la alternativa sería gitignorearlos y documentar el comando.

## Funcionalidades implementadas

- ✅ Listado de **películas** ordenadas por **populares** o **mejor evaluadas** (toggle).
- ✅ Listado de **series** ordenadas por **populares** o **mejor evaluadas** (toggle).
- ✅ Tabs en la home para alternar entre películas y series.
- ✅ **Detalle** de película/serie con poster, backdrop, rating, fecha, géneros, sinopsis, runtime/temporadas.
- ✅ **Búsqueda** por nombre (películas y series, con tabs separados, debounce 400ms).
- ✅ **Hero animation** del poster entre listado y detalle.
- ✅ **SliverAppBar colapsable** en la pantalla de detalle.
- ✅ **AnimatedSwitcher** entre estados loading/data/error.
- ✅ **Pull to refresh** en los listados.
- ✅ Manejo de errores con UI dedicada y botón de reintentar.
- ✅ Cache de imágenes (`cached_network_image`).
- ✅ Tests unitarios cubriendo cada capa (DTO mapping, repository, usecase, provider).

## Mejoras pendientes (cómo las haría)

Estas quedaron fuera por scope/tiempo. Son explícitamente las cosas que mencionaría en la entrevista como deuda técnica conocida:

| Mejora | Cómo |
|--------|------|
| **Paginación con scroll infinito** | Usar `AsyncNotifier` que mantiene una lista acumulada y un `int page` interno. Disparar el siguiente fetch con un `ScrollController` cuando el usuario llega cerca del final. |
| **Cache offline** | Agregar `Drift` o `Hive` en `data/datasources/local/`. El repository chequea cache primero, fallback a remote, actualiza cache (patrón stale-while-revalidate). |
| **Internacionalización** | `flutter_localizations` + `intl` con archivos `.arb`. Por ahora la API se pide con `language=es-AR`, pero la UI propia está hardcodeada en español. |
| **Backend proxy para la API key** | La API key está en `.env`, lo cual evita filtración por git pero igual queda en el binario. En producción real, lo correcto es un backend que actúa de proxy y guarda el token server-side. |
| **Tests de widget e integración** | Hoy hay tests de cada capa (data, domain, presentation/providers) pero no de UI. Agregaría tests de widget con `WidgetTester` para las pantallas principales y un test de integración E2E del golden path. |
| **CI/CD** | GitHub Actions corriendo `flutter analyze` + `flutter test` + `dart run build_runner build` en cada PR. |
| **Manejo de canceled requests en search** | El debounce está en el widget; idealmente también un `CancelToken` de Dio en el datasource para abortar requests en vuelo cuando el query cambia. |
| **Type-safe routing** | Migrar a `go_router_builder` con anotaciones para evitar string literals en `context.push('/movie/$id')`. |
| **Estados específicos vacíos vs error** | Hoy "no hay resultados" se muestra simple. Se podría diferenciar mejor entre "buscaste pero no hay" y "no buscaste todavía". |

## Metodología con asistencia de IA

Este proyecto se desarrolló con asistencia de **Claude Code** (Anthropic). La metodología fue:

1. **Planificación previa**: lectura del PDF del test, análisis de requisitos, propuesta de stack y arquitectura, validación de decisiones de scope con el desarrollador (películas+series, Riverpod, búsqueda incluida). Resultado guardado en un plan estructurado.
2. **Implementación guiada**: la IA generó el código siguiendo el plan acordado. Yo revisé cada archivo, validé que los providers y dependencias estuvieran bien conectados, y corregí decisiones cuando difería de la dirección que quería tomar.
3. **Decisiones de arquitectura y librerías**: validadas y entendidas por mí, no delegadas. Cada elección de stack tiene un razonamiento que puedo defender (ver `INTERVIEW_CHEATSHEET.md`).
4. **Resolución de problemas**: cuando aparecieron incompatibilidades del ecosistema (como un conflicto entre `analyzer 7.x` y `analyzer_plugin 0.12.0` que arrastraba `riverpod_generator`), evalué las opciones y decidí migrar de providers con code-gen a providers manuales — la elección minimiza dependencias frágiles y no compromete la calidad.
5. **Tests**: definidos con criterio de "1 test mínimo por capa" para demostrar conocimiento de testing en cada nivel (DTO mapping, repository, usecase, provider).

Cada commit es código que entiendo y puedo defender en una entrevista. La IA aceleró la generación de boilerplate (DTOs, providers, widgets simétricos entre movies y tv_shows) sin reemplazar el criterio técnico ni la comprensión del código.

## Estructura de tests

```
test/
├── helpers/
│   └── fixtures.dart                                    Datos de prueba reusables
└── features/
    ├── movies/
    │   ├── data/
    │   │   ├── models/movie_dto_test.dart              Parsing JSON + mapping a entidad
    │   │   └── repositories/movies_repository_impl_test.dart
    │   ├── domain/
    │   │   └── usecases/get_popular_movies_test.dart
    │   └── presentation/
    │       └── providers/movies_providers_test.dart    Loading/Data/Error states
    ├── tv_shows/
    │   └── domain/usecases/get_popular_tv_shows_test.dart
    └── search/
        └── presentation/providers/search_providers_test.dart
```

Resultado: `flutter test` corre **12 tests, todos verdes**.

## Contacto

- **Autor**: Santiago Montero (santiagojosemontero@gmail.com)
- **Repositorio**: [link al repo privado]
- **Acceso para evaluador**: alberto.marturelo@equifax.com
