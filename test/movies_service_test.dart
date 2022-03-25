import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:training/movies/movie.dart';
import 'package:training/movies/movies_provider.dart';
import 'package:training/movies/movies_service.dart';

import 'movies_service_test.mocks.dart';

@GenerateMocks([MoviesProvider])
void main() {
  final moviesProvider = MockMoviesProvider();
  final Movie _movieWithLowRating = Movie(
      "Rocky",
      1,
      [
        "https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg",
        "https://images-na.ssl-images-amazon.com/images/M/MV5BNzM2MDk3MTcyMV5BMl5BanBnXkFtZTcwNjg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg",
        "https://images-na.ssl-images-amazon.com/images/M/MV5BMTY2ODQ3NjMyMl5BMl5BanBnXkFtZTcwODg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg",
        "https://images-na.ssl-images-amazon.com/images/M/MV5BMTMxOTEwNDcxN15BMl5BanBnXkFtZTcwOTg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg",
        "https://images-na.ssl-images-amazon.com/images/M/MV5BMTYxMDg1Nzk1MV5BMl5BanBnXkFtZTcwMDk0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg"
      ],
      "Adventure",
      "1999");

  test("given movies when load then return movies with rating high rating", () async {
    when(moviesProvider.getMovies()).thenAnswer((_) async => [_movieWithLowRating]);
    final service = MoviesService(moviesProvider);
    expect(await service.loadMovies(), []);
  });

}

// flutter pub run build_runner build
