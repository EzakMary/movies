import 'package:flutter/material.dart';
import 'package:movies/API/ApiManager.dart';
import 'package:movies/Model/movies_model.dart';
import 'package:movies/UI/Widget/movies_row.dart';
import 'package:movies/UI/Widget/slider_movies.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<List<Movie>> trendsMovies;
  late Future<List<Movie>> comingMovies;
  late Future<List<Movie>> topRatedMovies;

  void initState() {
    // TODO: implement initState
    super.initState();
    trendsMovies = Api().getTrendingMovies();
    comingMovies = Api().getUpcomingMovies();
    topRatedMovies = Api().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            child: FutureBuilder(
              future: trendsMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return MoviesSlider(
                    snapshot: snapshot,
                  );
                } else {
                  return Container(
                      height: 400,
                      child: const Center(child: CircularProgressIndicator()));
                }
              },
            ),
          ),
          SizedBox(
              child: FutureBuilder(
            future: comingMovies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return RowMoviesList(
                  movies_list_name: "New Release",
                  snapshot: snapshot,
                );
              } else {
                return Container(
                    height: 400,
                    child: const Center(child: CircularProgressIndicator()));
              }
            },
          )),
          SizedBox(height: 10),
          SizedBox(
              child: FutureBuilder(
            future: topRatedMovies,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return RowMoviesList(
                  movies_list_name: "Recommended",
                  snapshot: snapshot,
                );
              } else {
                return Container(
                    height: 400,
                    child: const Center(child: CircularProgressIndicator()));
              }
            },
          )),
        ],
      ),
    );
  }
}
