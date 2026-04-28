# Contexto del proyecto para asistentes de IA

> Este archivo lo lee Gemini CLI automáticamente al iniciar. También sirve para Claude, Cursor, etc. Si vas a tocar este proyecto: leelo primero.

## Qué es

App móvil Flutter que consume TheMovieDB API. Es un test técnico para Equifax (Mobile Software Engineer). Va a defenderse en una entrevista técnica, así que cada decisión técnica importa y debe poder justificarse.

**Prioridades, en orden:**
1. Simplicidad y legibilidad — el evaluador debe entender el código rápido
2. Decisiones defendibles — prefiere lo "boring & probado" sobre lo "fancy"
3. Buenas prácticas: arquitectura, DI, testing — pero sin sobre-ingeniería

## Stack (no cambiar sin razón fuerte)

| Área | Librería | No usar |
|------|----------|---------|
| State + DI | `flutter_riverpod` (manual, **sin** code-gen) | `provider`, `get_it`, `bloc`, `getx` |
| HTTP | `dio` con interceptors | `http`, `chopper` |
| Modelos | `freezed` + `json_serializable` | clases manuales, `equatable` solo |
| Routing | `go_router` | `Navigator.push` directo, `auto_route` |
| Imágenes | `cached_network_image` | `Image.network` directo |
| Env | `flutter_dotenv` | `--dart-define` |
| Tests | `mocktail` | `mockito` |

## Arquitectura

**Clean Architecture light, feature-first.** Tres capas por feature:

```
lib/features/<feature>/
├── data/           DTOs (con freezed/json), datasource (Dio), repository impl
├── domain/         Entidad pura, repository abstract, usecases
└── presentation/   Providers Riverpod, páginas, widgets
```

Features actuales: `movies/`, `tv_shows/`, `search/`, `home/`.

`core/` para infraestructura compartida (Dio, theme, router, errores). `shared/widgets/` para widgets reusables (PosterImage, RatingBadge, ErrorView, LoadingGrid).

**Flujo de datos canónico:**
```
UI → ref.watch(provider) → Usecase → Repository (abstract)
   → RepositoryImpl → RemoteDataSource → Dio
   ← DTO.fromJson → DTO.toEntity() → Entity
   ← AsyncValue<T> en provider
```

## Convenciones (reglas del proyecto)

### Modelos
- **Siempre separar DTO (data layer) de Entity (domain layer)**. `MovieDto` conoce JSON snake_case de TMDB, `Movie` es la entidad limpia. Mapear con `toEntity()` en el DTO.
- DTO con **todos los campos nullable** excepto `id`. El JSON puede venir incompleto.
- Entity con defaults (`@Default(0.0)`, `@Default([])`) para evitar nullables en la UI cuando no son semánticos.
- Cabecera obligatoria en archivos con `@JsonKey` en factory: `// ignore_for_file: invalid_annotation_target`

### Errores
- `data/datasource` captura `DioException` y lanza `AppException` tipado (ver `core/error/exceptions.dart`).
- `repository` propaga, no captura silenciosamente.
- `provider` con `try/catch` natural — Riverpod los expone como `AsyncError`.
- UI usa `.when(data:, loading:, error:)` y muestra `ErrorView(error: e, onRetry: () => ref.invalidate(provider))`.
- **NO usar `Either<Failure, T>` ni `dartz`.** Decidido: agrega dependencia y verbosidad sin valor en este stack.

### Providers (Riverpod)
- **Manual, sin `@riverpod` annotation.** Razón histórica: `riverpod_generator` arrastra `analyzer_plugin 0.12.0` que no compila con `analyzer 7.x`. Si quieres volver a code-gen, primero verifica compatibilidad.
- Patrón estándar:
  ```dart
  final fooRepositoryProvider = Provider<FooRepository>((ref) {
    return FooRepositoryImpl(ref.watch(fooRemoteDataSourceProvider));
  });
  final fooListProvider = FutureProvider<List<Foo>>((ref) {
    return ref.watch(getFooUsecaseProvider).call();
  });
  ```
- Para detalle: `FutureProvider.family.autoDispose<T, Param>((ref, id) => ...)`.
- Para estado mutable simple (categoría, query): `StateProvider<T>`.

### Naming
- Archivos: `snake_case.dart` (`movie_card.dart`, no `MovieCard.dart`).
- Clases públicas: `PascalCase`. Privadas a un archivo: con `_` prefix.
- Providers: `camelCase` terminando en `Provider` (`moviesRepositoryProvider`).

### Estilo Dart
- `const` constructors siempre que se pueda.
- Inmutabilidad por defecto (freezed lo da gratis).
- `final` por defecto, `var` solo si realmente reasigna.
- Sin comentarios redundantes que repiten lo que el código dice. Solo comentar el "por qué" cuando no es obvio.

## Anti-patrones (cosas que NO hacer)

- **No** introducir `Either<Failure, T>` / `dartz`.
- **No** mezclar layer-first con feature-first. La estructura es **feature-first** y cada feature tiene su clean arch interno.
- **No** llamar a Dio directamente desde la UI o desde un provider de presentation.
- **No** importar `data/` desde `domain/`. La dirección de dependencia es `presentation → domain ← data`.
- **No** mutar estado de freezed (usar `copyWith`).
- **No** agregar `BuildContext` a clases de domain o data.
- **No** hardcodear strings de TMDB en el código — todo va en `core/network/api_endpoints.dart`.
- **No** committear `.env`. Está en `.gitignore`. Sí committear `.env.example`.
- **No** agregar features fuera de scope: paginación, cache offline, i18n completa, autenticación de usuario TMDB. Están listadas en el README como mejoras pendientes a propósito.

## Workflow

### Setup inicial (en una clone fresca)
```bash
flutter pub get
cp .env.example .env  # completar TMDB_BEARER_TOKEN
dart run build_runner build --delete-conflicting-outputs
```

### Después de modificar modelos con freezed/json_serializable
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Validación obligatoria antes de cada commit
```bash
flutter analyze   # debe decir "No issues found!"
flutter test      # los 12 tests deben pasar (más si agregás)
```

### Correr la app
```bash
flutter run
```

## Decisión: archivos generados committeados

Los `*.freezed.dart` y `*.g.dart` **están en el repo** (no gitignoreados). Razón: el evaluador puede hacer `flutter pub get && flutter run` directo, sin tener que correr `build_runner`. Trade-off conocido: más ruido en los diffs cuando se cambian modelos. **No revertir esta decisión sin acordar.**

## Decisión: providers manuales vs code-gen

Probado: `riverpod_generator 2.6.4` requiere `riverpod_analyzer_utils 0.5.9` que arrastra `analyzer_plugin 0.12.0`, incompatible con `analyzer 7.6.0` (rompe el build con errores `Element` vs `Element2`). Solución: providers manuales. Si Riverpod 3.x estable o `riverpod_generator` actualizado resuelve esto, se puede migrar — pero validar primero con `dart run build_runner build`.

## Tests

- 12 tests cubriendo cada capa (DTO, repository, usecase, providers).
- Estructura espejo del `lib/`: `test/features/<feature>/<layer>/...`.
- Fixtures compartidas en `test/helpers/fixtures.dart`.
- Patrón de provider test: `ProviderContainer(overrides: [...])` con mocks de mocktail.
- Para errores asíncronos: `expectLater(future, throwsA(isA<MyException>()))`. **No** usar `.then(onError: ...)` — rompe por type mismatch.

## Archivos clave

- `pubspec.yaml` — dependencias. Cualquier librería nueva justificarla.
- `lib/main.dart` — bootstrap (dotenv, locale, ProviderScope, MaterialApp.router).
- `lib/core/network/dio_client.dart` — Dio configurado, fuente única de verdad para HTTP.
- `lib/core/router/app_router.dart` — todas las rutas declaradas acá.
- `lib/core/error/exceptions.dart` — taxonomía de excepciones del dominio.
- `README.md` — documentación pública para el evaluador.
- `INTERVIEW_CHEATSHEET.md` — material privado del autor (gitignored).

## Si necesitás agregar una nueva feature

1. Crear `lib/features/<nombre>/{data,domain,presentation}/`.
2. Empezar por `domain/`: entity con freezed, repository abstract, usecases.
3. Luego `data/`: DTO con freezed+json, datasource con Dio, repository impl.
4. Finalmente `presentation/`: providers, páginas, widgets.
5. Registrar la ruta en `core/router/app_router.dart`.
6. Correr `dart run build_runner build --delete-conflicting-outputs`.
7. Agregar al menos 1 test por capa.
8. `flutter analyze && flutter test` antes de commitear.

## Idioma

Todo el código y los comentarios pueden mezclar inglés (identificadores, librerías) y español (comentarios, mensajes UI). La UI debe estar en español. La API se pide en `language=es` cuando aplica.
