import 'package:cinemapedia/presentation/providers/storage/favorite_movies_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  bool isLastPage = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    setState(() => isLoading = true);
    final movies =
        await ref.read(favoriteMovieProvider.notifier).loadNextPage();
    setState(() => isLoading = false);
    if (movies.isEmpty) setState(() => isLastPage = true);
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMovieProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp,
                size: 100, color: colors.primary),
            Text('Oh my god!!',
                style: TextStyle(fontSize: 30, color: colors.primary)),
            const Text('You don\'t have any favorite movie yet',
                style: TextStyle(fontSize: 15, color: Colors.black54)),
            const SizedBox(height: 20),
            FilledButton.tonal(
                onPressed: () => context.go('/home/0'),
                child: const Text('Discover movies',
                    style: TextStyle(fontSize: 15)))
          ],
        ),
      );
    }

    return MovieMasonry(movies: favoriteMovies, loadNextPage: loadNextPage);
  }
}
