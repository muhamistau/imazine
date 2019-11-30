import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;
import 'package:imazine/detail.dart';
import 'dart:convert';
import 'package:transparent_image/transparent_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imazine App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Imazine Homepage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Base URL for our wordpress API
  final String apiUrl = "http://himatif.fmipa.unpad.ac.id/wp-json/wp/v2/";
  // Empty list for our posts
  List posts;
  int page = 1;

  @override
  void initState() {
    super.initState();
    this.getPosts(page);
  }

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
        backgroundColor: Colors.amber
      ),
      backgroundColor: Color(0xFF121212),
      body: ListView.builder(
        itemCount: posts == null ? 0 : posts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Column(
              children: <Widget>[
                Card(
                  color: Color(0xFF1F1F1F),
                  child: Column(
                    children: <Widget>[
                      FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: posts[index]["featured_media"] == 0 
                                ? 'images/placeholder.png'
                                : posts[index]["_embedded"]["wp:featuredmedia"][0]["source_url"],
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0), 
                            child: Text(
                              HtmlUnescape().convert(posts[index]["title"]["rendered"]),
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            )
                          ),
                          subtitle: Text(
                            HtmlUnescape().convert(posts[index]["excerpt"]["rendered"].replaceAll(RegExp(r'<[^>]*>'), '')),
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            onTap: () {
              var featuredMedia = posts[index]["featured_media"] == 0 
                ? 'images/placeholder.png'
                : posts[index]["_embedded"]["wp:featuredmedia"][0]["source_url"];
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    title: HtmlUnescape().convert(posts[index]["title"]["rendered"]),
                    content: HtmlUnescape().convert(posts[index]["content"]["rendered"].replaceAll(RegExp(r'<[^>]*>'), '')),
                    featuredMedia: featuredMedia,
                  )
                )
              );
            }
          );
        },
      ),
    );
  }

  // Function to fetch list of posts
   Future<String> getPosts(int page) async {

    var res = await http.get(Uri.encodeFull(apiUrl + "posts?_embed&per_page=30&page=" + page.toString()), headers: {"Accept": "application/json"});

    // fill our posts list with results and update state
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });

    return "Success!";
  }

}
