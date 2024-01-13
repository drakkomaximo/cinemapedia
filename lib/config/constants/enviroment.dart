import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'nO HAY API KEY';
  static String theMovieDbUrl = dotenv.env['THE_MOVIEDB_URL'] ?? 'nO HAY API URL';
  static String language = 'es-MX';
  static String imageMovieDbUrl = 'https://image.tmdb.org/t/p/w500';
  static String posterNotFound = 'https://linnea.com.ar/wp-content/uploads/2018/09/404PosterNotFound.jpg';
  static String photoNotFound = 'https://img.freepik.com/free-icon/user_318-150866.jpg';
  static String noPoster = 'https://www.csaff.org/wp-content/uploads/csaff-no-poster.jpg';
}