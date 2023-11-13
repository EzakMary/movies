import 'package:flutter/material.dart';
import 'package:movies/UI/Tabs/browse_tab.dart';
import 'package:movies/UI/Tabs/home_tab.dart';
import 'package:movies/UI/Tabs/search_tab.dart';
import 'package:movies/UI/Tabs/watch_list_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// late Future<List<TrendsMovie>> trendsMovies;

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [HomeTab(), SearchTab(), BrowseTab(), WatchListTab()];
  int current_tab = 0;

  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   trendsMovies= API().getTrendsMovies();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies App"),
        centerTitle: true,
      ),
      body: tabs[current_tab],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: current_tab,
      onTap: (index) => setState(() {
        current_tab = index;
      }),
      selectedItemColor: Color(0xffFFBB3B),
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Category"),
        BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list_sharp), label: "Watch List"),
      ],
    );
  }
}
