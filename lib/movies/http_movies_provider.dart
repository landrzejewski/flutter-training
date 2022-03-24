import 'dart:convert';

import 'package:http/http.dart';
import 'package:training/movies/movie.dart';
import 'package:training/movies/movies_provider.dart';

class HttpMoviesProvider implements MoviesProvider {
  final String _url;
  HttpMoviesProvider(this._url);

  @override
  Future<List<Movie>> getMovies() async {
    final response = await get(Uri.parse(_url));
    if (response.statusCode == 200) {
      return json.decode(response.body)
    }
  }
}
