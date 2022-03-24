import 'package:training/movies/movie.dart';

abstract class MoviesProvider {

  Future<List<Movie>> getMovies();

}