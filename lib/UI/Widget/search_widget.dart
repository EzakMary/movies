import 'package:flutter/material.dart';
import 'package:movies/API/ApiManager.dart';
import 'package:movies/Model/movies_model.dart';
import 'package:movies/UI/Screens/search_suggestion_screen.dart';

class CustomMovieSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  Api _movie = Api();

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
          child: FutureBuilder<List<Movie>>(
        future: _movie.getSearch(query: query),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return SearchMovieSuggestion(
              snapshot: snapshot,
            );
          } else {
            return Container(
                width: double.infinity,
                height: double.infinity,
                child: const Center(child: CircularProgressIndicator()));
          }
        },
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search Movie"),
    );
  }
}
