import 'package:flutter/material.dart';
import 'movies_service.dart';
import 'movie.dart';

class Movies extends StatefulWidget {
  final MoviesService moviesService;
  const Movies({Key? key, required this.moviesService}) : super(key: key);

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
                    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(movie.images.first), fit: BoxFit.cover), color: Colors.grey.shade700, borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                title: Text(movie.title, style: const TextStyle(color: Colors.blue)),
                trailing: const Text(">", style: TextStyle(color: Colors.blue)),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(movie: movie))),
              ),
            );
          }),
    );
  }
}

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(movie.title), backgroundColor: Colors.grey),
        backgroundColor: Colors.grey.shade200,
        body: Center(
            child: ListView(children: [
          MovieThumbnail(thumbnailUrl: movie.images[0]),
          MovieDescription(movie: movie),
        ])));
  }
}

class MovieThumbnail extends StatelessWidget {
  final String thumbnailUrl;
  const MovieThumbnail({Key? key, required this.thumbnailUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Stack(alignment: Alignment.center, children: [
        Container(height: 200, width: MediaQuery.of(context).size.width, decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(thumbnailUrl), fit: BoxFit.cover))),
        Icon(Icons.play_circle_fill, size: 150, color: Colors.white.withOpacity(0.4))
      ]),
      Container(decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xefefef), Color(0xffa59f9f)], begin: Alignment.topCenter, end: Alignment.bottomCenter)), height: 150)
    ]);
  }
}

class MovieDescription extends StatelessWidget {
  final Movie movie;
  const MovieDescription({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), child: Row(children: [MoviePoster(posterUrl: movie.images[1]), const SizedBox(width: 20), MovieInfo(movie: movie)]));
  }
}

class MoviePoster extends StatelessWidget {
  final String posterUrl;
  const MoviePoster({Key? key, required this.posterUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(width: MediaQuery.of(context).size.width / 4, height: 160, decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(posterUrl), fit: BoxFit.cover)))),
    );
  }
}

class MovieInfo extends StatelessWidget {
  final Movie movie;
  const MovieInfo({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("${movie.year} - ${movie.genre}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.blue.shade700.withOpacity(0.8)))]);
  }
}
