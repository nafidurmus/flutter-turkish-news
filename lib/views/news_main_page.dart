import 'package:flutter/material.dart';
import 'package:turkish_news/views/sign_in.dart';
import 'home_page.dart';

class NewsMainPage extends StatefulWidget {
  NewsMainPage({Key key}) : super(key: key);

  @override
  _NewsMainPageState createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: null)],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue[100], Colors.blue[400]],
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      imageUrl ?? '',
                    ),
                    radius: 20,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: 40),
                  Text(
                    email,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              signOutGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) {
                return HomePage();
              }), ModalRoute.withName('/'));
            },
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Sign Out',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          )
        ],
      ),
    );
  }
}
