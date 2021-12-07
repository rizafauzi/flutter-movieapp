import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:movie_app/data/models/movie.dart';
import 'package:movie_app/data/models/movie_detail.dart';

class MovieProvider {
  Future getMovieList(keyword) async {
    try {
      final url =
          Uri.parse('https://www.omdbapi.com/?apikey=faf7e5bb&s=$keyword');
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw new Exception('error getting movie list');
      }

      final json = jsonDecode(response.body);
      List<dynamic> movieList = json['Search'];
      List<Movie> converted = movieList.map((e) => Movie.fromJson(e)).toList();

      return converted;
    } catch (err) {
      print('ERROR: $err');
    }
  }

  Future getMovieById(id) async {
    try {
      final url = Uri.parse('https://www.omdbapi.com/?apikey=faf7e5bb&i=$id');
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw new Exception('error getting movie');
      }

      final json = jsonDecode(response.body);
      MovieDetail converted = MovieDetail.fromJson(json);
      return converted;
    } catch (err) {
      print('ERROR: $err');
    }
  }
}
