import 'package:flutter/material.dart';
import 'movies_service.dart';
import 'movie.dart';

class Movies extends StatefulWidget {
  MoviesService moviesService;
  Movies({Key? key, required this.moviesService}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    widget.moviesService.loadMovies().then(_onMoviesLoaded);
  }

  _onMoviesLoaded(List<Movie> movies) {
    setState(() => _movies = movies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movies"), backgroundColor: Colors.grey),
      backgroundColor: Colors.grey.shade200,
      body: ListView.builder(
          itemCount: _movies.length,
          itemBuilder: (BuildContext context, int index) {
            final movie = _movies[index];
            return Card(
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade700,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(movie.images.first), fit: BoxFit.cover),
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
                title: Text(movie.title, style: const TextStyle(color: Colors.blue)),
                trailing: const Text(">", style: TextStyle(color: Colors.blue)),
              ),
            );
          }),
    );
  }
}
