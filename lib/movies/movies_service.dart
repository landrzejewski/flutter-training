import 'package:training/movies/movie.dart';
import 'package:training/movies/movies_provider.dart';
import 'movie.dart';
import 'movies_provider.dart';

class MoviesService {
  final MoviesProvider _moviesProvider;

  const MoviesService(this._moviesProvider);

  Future<List<Movie>> loadMovies() {
    return _moviesProvider
        .getMovies()
        .then((movies) => movies.where(_hasHighRating).toList());
  }

  bool _hasHighRating(Movie movie) {
    return movie.imbdRating > 5;
  }
}
