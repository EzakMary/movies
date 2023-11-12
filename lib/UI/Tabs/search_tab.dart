import 'package:flutter/material.dart';
import 'package:movies/API/ApiManager.dart';
import 'package:movies/Model/movies_model.dart';
import 'package:movies/UI/Screens/search_suggestion_screen.dart';
import 'package:movies/UI/Widget/search_widget.dart';

class SearchTab extends StatefulWidget {
  SearchTab({
    super.key,
  });

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  late Future<List<Movie>> trendsMovies;

  void initState() {
    // TODO: implement initState
    super.initState();
    trendsMovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomMovieSearch());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Container(
          child: FutureBuilder(
        future: trendsMovies,
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
}
