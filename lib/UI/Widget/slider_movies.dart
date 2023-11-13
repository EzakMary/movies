import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/UI/Screens/details_screen.dart';
import 'package:movies/UI/utils/constant.dart';

class MoviesSlider extends StatelessWidget {
  MoviesSlider({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: CarouselSlider.builder(
          itemCount: snapshot.data.length,
          options:
              CarouselOptions(autoPlay: true, height: 400, viewportFraction: 1),
          itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) =>
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(movie: snapshot.data[itemIndex]),
                      ));
                },
                child: MoviesSliderShape(snapshot: snapshot, index: itemIndex),
              )),
    );
  }
}

class MoviesSliderShape extends StatefulWidget {
  MoviesSliderShape({
    super.key,
    required this.snapshot,
    required this.index,
  });

  final AsyncSnapshot snapshot;

  int? index;

  @override
  State<MoviesSliderShape> createState() => _MoviesSliderShapeState();
}

class _MoviesSliderShapeState extends State<MoviesSliderShape> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Column(
            children: [
              Container(
                child: isLoading
                    ? Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ))
                    : Container(
                        child: Image.network(
                            "${Constants.imagePath}${widget.snapshot.data[widget.index].backdropPath}",
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover),
                      ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 155),
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            '''${widget.snapshot.data[widget.index].title}''',
                            style: TextStyle(fontSize: 16),
                            softWrap: true,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
              margin: EdgeInsets.only(bottom: 80, left: 20),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              height: 188,
              width: 127,
              child: Image.network(
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                '${Constants.imagePath}${widget.snapshot.data[widget.index].posterPath}',
              )),
        ),
      ],
    );
  }
}
