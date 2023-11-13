import 'package:flutter/material.dart';
import 'package:movies/UI/Screens/category_movies.dart';
import 'package:movies/UI/utils/app_theme.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 3),
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryMovies(
                      id: snapshot.data[index].id,
                      category: snapshot.data[index].name),
                ));
          },
          child: Container(
            height: 10,
            width: 10,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppTheme.BottomNavigationBarColor),
            child: Center(
                child: Text(
              snapshot.data[index].name,
              style: TextStyle(fontSize: 20),
            )),
          ),
        );
      },
    );
  }
}
