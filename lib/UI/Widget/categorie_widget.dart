import 'package:flutter/material.dart';
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
        return Container(
          height: 10,
          width: 10,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppTheme.BottomNavigationBarColor),
          child: Center(
              child: Text(
            "ACTION",
            style: TextStyle(fontSize: 20),
          )),
        );
      },
    );
  }
}
