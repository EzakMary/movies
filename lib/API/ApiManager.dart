import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/Model/movies_model.dart';
import 'package:movies/UI/utils/constant.dart';

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const _categoryUrl =
      'https://api.themoviedb.org/3/genre/movie/list?api_key=${Constants.apiKey}';

  List<Movie> result = [];
  var response = [];

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  static Future<List<Movie>> getSimilar(int? id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/similar?api_key=${Constants.apiKey}'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  static Future<List<Movie>> getDetails(int? id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/similar?api_key=${Constants.apiKey}'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getSearch({String? query}) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?query=$query&include_adult=false&language=en-US&page=1&api_key=${Constants.apiKey}'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getCategory() async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/genre/movie/list?api_key=ad6700b316c170aaf5439564bea956d4"));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}
