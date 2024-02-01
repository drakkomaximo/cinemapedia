import 'package:cinemapedia/domain/datasources/local_storage_satasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final LocalStorageDataSource dataSource;

  LocalStorageRepositoryImpl(this.dataSource);

  @override
  Future<bool> isMovieFavorite({required int movieId}) {
    return dataSource.isMovieFavorite(movieId: movieId);
  }

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) {
    return dataSource.loadMovies(limit: limit, offset: offset);
  }

  @override
  Future<void> toggleFavorite({required Movie movie}) {
    return dataSource.toggleFavorite(movie: movie);
  }
  
}