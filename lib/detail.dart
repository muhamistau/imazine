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
          title,
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
                  children: <Widget>[
                    Text(
                      content,
                      style: TextStyle(
                        color: Colors.grey
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