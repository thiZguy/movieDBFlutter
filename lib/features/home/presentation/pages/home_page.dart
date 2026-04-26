import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../movies/presentation/pages/movies_page.dart';
import '../../../tv_shows/presentation/pages/tv_shows_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'TMDB',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Buscar',
              onPressed: () => context.push('/search'),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.movie), text: 'Películas'),
              Tab(icon: Icon(Icons.tv), text: 'Series'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [MoviesPage(), TvShowsPage()],
        ),
      ),
    );
  }
}
