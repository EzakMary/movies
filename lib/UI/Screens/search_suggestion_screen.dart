import 'package:flutter/material.dart';
import 'package:movies/UI/Screens/details_screen.dart';
import 'package:movies/UI/utils/constant.dart';

class SearchMovieSuggestion extends StatelessWidget {
  const SearchMovieSuggestion({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(movie: snapshot.data[index]),
                ));
          },
          child: Card(
              child: ListTile(
            leading: Container(
              height: 60,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                  "${Constants.imagePath}${snapshot.data[index].posterPath}"),
            ),
            title: Text(snapshot.data[index].originalTitle),
            subtitle: Text(snapshot.data[index].releaseDate),
            trailing: Icon(Icons.add),
          )),
        );
      },
    );
  }
}
