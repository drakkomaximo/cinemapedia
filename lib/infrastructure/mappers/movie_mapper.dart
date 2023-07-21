import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/movieDb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/movieDb/movie_movidedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDb moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? '${Enviroment.imageMovieDbUrl}${moviedb.backdropPath}'
          : Enviroment.posterNotFound,
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
          ? '${Enviroment.imageMovieDbUrl}${moviedb.posterPath}'
          : Enviroment.noPoster,
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);

  static Movie movieDetailsToEntity(MovieDetailsResponse moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
          ? '${Enviroment.imageMovieDbUrl}${moviedb.backdropPath}'
          : Enviroment.posterNotFound,
      genreIds: moviedb.genres.map((e) => e.name).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
          ? '${Enviroment.imageMovieDbUrl}${moviedb.posterPath}'
          : Enviroment.posterNotFound,
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
