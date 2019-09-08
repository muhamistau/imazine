import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  final String content;
  final String featuredMedia;

  DetailScreen({
    Key key,
    @required this.title,
    @required this.content,
    this.featuredMedia
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "IMAZINE APP",
          style: TextStyle(
            fontFamily: 'Strasua',
            color: Colors.white
          ),
        ),
      ),
      backgroundColor: Color(0xFF121212),
      body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: featuredMedia
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white
                        ),
                      ),
                    ),
                    Text(
                      content,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        )
    );
  }
}