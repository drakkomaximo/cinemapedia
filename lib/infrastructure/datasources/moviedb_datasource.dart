import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/movieDb/movie_details.dart';
import 'package:cinemapedia/infrastructure/models/movieDb/moviedb_response.dart';
import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: Enviroment.theMovieDbUrl,
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': Enviroment.language
      }));

  List<Movie> _jsonToMivies(Map<String, dynamic> json) {
    final movieDbResponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDbResponse.results
        .where((moviedb) => moviedb.posterPath != Enviroment.noPoster)
        .map((moviedb) => MovieMapper.movieDbToEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _jsonToMivies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMivies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMivies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpComing({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMivies(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
    final response =
        await dio.get('/movie/$id');
    if( response.statusCode != 200) throw Exception('Movie with id: $id not found');

    final movieDetails = MovieDetailsResponse.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    return movie;
  }
}
