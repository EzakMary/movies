import 'package:flutter/material.dart';
import 'package:movies/API/ApiManager.dart';
import 'package:movies/Model/movies_model.dart';
import 'package:movies/UI/Widget/movies_row.dart';
import 'package:movies/UI/utils/constant.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "details";

  DetailsScreen({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.originalTitle!),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                  '${Constants.imagePath}${movie.backdropPath}',
                  fit: BoxFit.cover),
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 8, bottom: 8),
                    child: Container(
                      child: Text(
                        movie.originalTitle!,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Container(
                      child: Text(
                        ' Release Date: ${movie.releaseDate}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 20, left: 20),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 188,
                          width: 127,
                          child: Image.network(
                              '${Constants.imagePath}${movie.posterPath}')),
                      Flexible(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: SingleChildScrollView(
                                child: Text(
                                  '''${movie.overview}''',
                                  style: TextStyle(fontSize: 12),
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 3),
                                Text(
                                    "${movie.voteAverage!.toStringAsFixed(1)}"),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
                child: FutureBuilder(
              future: Api.getSimilar(movie.id as int?),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return RowMoviesList(
                    movies_list_name: "Similar",
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
      ),
    );
  }
}
