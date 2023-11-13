import 'package:flutter/material.dart';
import 'package:movies/API/ApiManager.dart';
import 'package:movies/UI/Screens/details_screen.dart';
import 'package:movies/UI/utils/constant.dart';

class CategoryMovies extends StatelessWidget {
  static const String routeName = "MoviesCat";

  CategoryMovies({super.key, required this.id, required this.category});

  int id;
  String category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: Container(
          child: FutureBuilder(
        future: Api.getListCategory(id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return BuildCategoryMoviesWidget(
              snapshot: snapshot,
            );
          } else {
            return Container(
                child: const Center(child: CircularProgressIndicator()));
          }
        },
      )),
    );
  }
}

class BuildCategoryMoviesWidget extends StatelessWidget {
  const BuildCategoryMoviesWidget({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: snapshot.data.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.65),
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
            margin: EdgeInsets.all(8),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              "${Constants.imagePath}${snapshot.data[index].posterPath}",
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
