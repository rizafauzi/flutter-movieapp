import 'package:equatable/equatable.dart';

class MovieResponse {
  late List<Movie> search;

  MovieResponse({required this.search});

  MovieResponse.fromJson(Map<String, dynamic> json) {
    if (json['Search'] != null) {
      search = <Movie>[];
      json['Search'].forEach((v) {
        search.add(Movie.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.search != null) {
      data['Search'] = this.search.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movie extends Equatable {
  final String title;
  final String year;
  final String type;
  final String imdbId;
  final String poster;

  Movie({
    required this.title,
    required this.year,
    required this.type,
    required this.poster,
    required this.imdbId,
  });

  @override
  List<Object> get props => [title, year, poster, imdbId];

  static Movie fromJson(dynamic json) {
    return Movie(
      year: json['Year'],
      title: json['Title'],
      type: json['Type'],
      poster: json['Poster'],
      imdbId: json['imdbID'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Year'] = this.year;
    data['imdbID'] = this.imdbId;
    data['Type'] = this.type;
    data['Poster'] = this.poster;
    return data;
  }
}
