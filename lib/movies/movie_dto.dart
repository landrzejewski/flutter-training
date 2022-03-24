class MovieDto {
  String? _title;
  String? _year;
  String? _rated;
  String? _released;
  String? _runtime;
  String? _genre;
  String? _director;
  String? _writer;
  String? _actors;
  String? _plot;
  String? _language;
  String? _country;
  String? _awards;
  String? _poster;
  String? _metascore;
  String? _imdbRating;
  String? _imdbVotes;
  String? _imdbID;
  String? _type;
  String? _response;
  List<String>? _images;

  MovieDto(
      {String? title,
      String? year,
      String? rated,
      String? released,
      String? runtime,
      String? genre,
      String? director,
      String? writer,
      String? actors,
      String? plot,
      String? language,
      String? country,
      String? awards,
      String? poster,
      String? metascore,
      String? imdbRating,
      String? imdbVotes,
      String? imdbID,
      String? type,
      String? response,
      List<String>? images}) {
    if (title != null) {
      this._title = title;
    }
    if (year != null) {
      this._year = year;
    }
    if (rated != null) {
      this._rated = rated;
    }
    if (released != null) {
      this._released = released;
    }
    if (runtime != null) {
      this._runtime = runtime;
    }
    if (genre != null) {
      this._genre = genre;
    }
    if (director != null) {
      this._director = director;
    }
    if (writer != null) {
      this._writer = writer;
    }
    if (actors != null) {
      this._actors = actors;
    }
    if (plot != null) {
      this._plot = plot;
    }
    if (language != null) {
      this._language = language;
    }
    if (country != null) {
      this._country = country;
    }
    if (awards != null) {
      this._awards = awards;
    }
    if (poster != null) {
      this._poster = poster;
    }
    if (metascore != null) {
      this._metascore = metascore;
    }
    if (imdbRating != null) {
      this._imdbRating = imdbRating;
    }
    if (imdbVotes != null) {
      this._imdbVotes = imdbVotes;
    }
    if (imdbID != null) {
      this._imdbID = imdbID;
    }
    if (type != null) {
      this._type = type;
    }
    if (response != null) {
      this._response = response;
    }
    if (images != null) {
      this._images = images;
    }
  }

  String? get title => _title;
  set title(String? title) => _title = title;
  String? get year => _year;
  set year(String? year) => _year = year;
  String? get rated => _rated;
  set rated(String? rated) => _rated = rated;
  String? get released => _released;
  set released(String? released) => _released = released;
  String? get runtime => _runtime;
  set runtime(String? runtime) => _runtime = runtime;
  String? get genre => _genre;
  set genre(String? genre) => _genre = genre;
  String? get director => _director;
  set director(String? director) => _director = director;
  String? get writer => _writer;
  set writer(String? writer) => _writer = writer;
  String? get actors => _actors;
  set actors(String? actors) => _actors = actors;
  String? get plot => _plot;
  set plot(String? plot) => _plot = plot;
  String? get language => _language;
  set language(String? language) => _language = language;
  String? get country => _country;
  set country(String? country) => _country = country;
  String? get awards => _awards;
  set awards(String? awards) => _awards = awards;
  String? get poster => _poster;
  set poster(String? poster) => _poster = poster;
  String? get metascore => _metascore;
  set metascore(String? metascore) => _metascore = metascore;
  String? get imdbRating => _imdbRating;
  set imdbRating(String? imdbRating) => _imdbRating = imdbRating;
  String? get imdbVotes => _imdbVotes;
  set imdbVotes(String? imdbVotes) => _imdbVotes = imdbVotes;
  String? get imdbID => _imdbID;
  set imdbID(String? imdbID) => _imdbID = imdbID;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get response => _response;
  set response(String? response) => _response = response;
  List<String>? get images => _images;
  set images(List<String>? images) => _images = images;

  MovieDto.fromJson(Map<String, dynamic> json) {
    _title = json['Title'];
    _year = json['Year'];
    _rated = json['Rated'];
    _released = json['Released'];
    _runtime = json['Runtime'];
    _genre = json['Genre'];
    _director = json['Director'];
    _writer = json['Writer'];
    _actors = json['Actors'];
    _plot = json['Plot'];
    _language = json['Language'];
    _country = json['Country'];
    _awards = json['Awards'];
    _poster = json['Poster'];
    _metascore = json['Metascore'];
    _imdbRating = json['imdbRating'];
    _imdbVotes = json['imdbVotes'];
    _imdbID = json['imdbID'];
    _type = json['Type'];
    _response = json['Response'];
    _images = json['Images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this._title;
    data['Year'] = this._year;
    data['Rated'] = this._rated;
    data['Released'] = this._released;
    data['Runtime'] = this._runtime;
    data['Genre'] = this._genre;
    data['Director'] = this._director;
    data['Writer'] = this._writer;
    data['Actors'] = this._actors;
    data['Plot'] = this._plot;
    data['Language'] = this._language;
    data['Country'] = this._country;
    data['Awards'] = this._awards;
    data['Poster'] = this._poster;
    data['Metascore'] = this._metascore;
    data['imdbRating'] = this._imdbRating;
    data['imdbVotes'] = this._imdbVotes;
    data['imdbID'] = this._imdbID;
    data['Type'] = this._type;
    data['Response'] = this._response;
    data['Images'] = this._images;
    return data;
  }
  
}
