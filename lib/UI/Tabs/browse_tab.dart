import 'package:flutter/material.dart';
import 'package:movies/API/ApiManager.dart';
import 'package:movies/Model/movies_model.dart';
import 'package:movies/UI/Widget/categorie_widget.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  late Future<List<Genres>> category;

  void initState() {
    // TODO: implement initState
    super.initState();
    category = Api().getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: category,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return CategoriesWidget(
              snapshot: snapshot,
            );
          } else {
            return Container(
                child: const Center(child: CircularProgressIndicator()));
          }
        },
      ),
    );
  }
}
