import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageDataSource {
  Future<void> toggleFavorite({required Movie movie});
  Future<bool> isMovieFavorite({required int movieId});
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0});
}