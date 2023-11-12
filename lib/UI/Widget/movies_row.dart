import 'package:flutter/material.dart';
import 'package:movies/UI/Screens/details_screen.dart';
import 'package:movies/UI/utils/constant.dart';

class RowMoviesList extends StatelessWidget {
  String movies_list_name;

  RowMoviesList({
    required this.movies_list_name,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff282A28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("$movies_list_name", style: TextStyle(fontSize: 20)),
          ),
          Container(
            height: 200,
            color: Color(0xff282A28),
            child: ListView.separated(
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 15),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
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
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: EdgeInsets.all(4),
                    height: 150,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      '${Constants.imagePath}${snapshot.data[index].posterPath}',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 1);
              },
            ),
          ),
        ],
      ),
    );
  }
}
