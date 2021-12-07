// "Title":

class Ratings {
  final String source;
  final String value;

  Ratings({
    required this.source,
    required this.value,
  });

  static Ratings fromJson(dynamic json) {
    return Ratings(
      source: json['Source'],
      value: json['Value'],
    );
  }
}

class MovieDetail {
  final String title;
  final String year;
  final String rated;
  final String release;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String poster;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbId;
  final String type;
  final String dvd;
  final String boxOffice;
  final String production;
  final String website;
  final String response;
  final List<Ratings> ratings;

  MovieDetail(
      {required this.title,
      required this.year,
      required this.rated,
      required this.release,
      required this.runtime,
      required this.genre,
      required this.director,
      required this.writer,
      required this.actors,
      required this.plot,
      required this.language,
      required this.country,
      required this.awards,
      required this.poster,
      required this.metascore,
      required this.imdbRating,
      required this.imdbVotes,
      required this.imdbId,
      required this.type,
      required this.dvd,
      required this.boxOffice,
      required this.production,
      required this.website,
      required this.response,
      required this.ratings});

  static MovieDetail fromJson(dynamic json) {
    return MovieDetail(
      title: json['Title'],
      year: json['Year'],
      rated: json['Rated'],
      release: json['Released'],
      runtime: json['Runtime'],
      genre: json['Genre'],
      director: json['Director'],
      writer: json['Writer'],
      actors: json['Actors'],
      plot: json['Plot'],
      language: json['Language'],
      country: json['Country'],
      awards: json['Awards'],
      poster: json['Poster'],
      metascore: json['Metascore'],
      imdbRating: json['imdbRating'],
      imdbVotes: json['imdbVotes'],
      imdbId: json['imdbID'],
      type: json['Type'],
      dvd: json['DVD'],
      boxOffice: json['BoxOffice'],
      production: json['Production'],
      website: json['Website'],
      response: json['Response'],
      ratings:
          (json['Ratings'] as List).map((e) => Ratings.fromJson(e)).toList(),
    );
  }
}
