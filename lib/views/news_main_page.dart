import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert' show utf8;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';

import 'settings_page.dart';

class NewsMainPage extends StatefulWidget {
  final String title;
  final User user;
  NewsMainPage({Key key, this.user, this.title}) : super(key: key);

  @override
  _NewsMainPageState createState() => _NewsMainPageState();
}

class _NewsMainPageState extends State<NewsMainPage> {
  RssFeed _feed;
  String rssurl = 'https://t24.com.tr/rss';

  static const String placeholderImg = 'assets/google_logo.png';
  GlobalKey<RefreshIndicatorState> _refreshKey;

  //Web view için kullanılabilir.

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
      );
      return;
    }
  }

  Future<void> load() async {
    await loadFeed().then((result) async {
      if (null == result || result.toString().isEmpty) {
        return;
      }
      setState(() {
        _feed = result;
      });
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(rssurl);
      final responseBody = utf8.decode(response.bodyBytes);
      return RssFeed.parse(responseBody);
    } on Exception {
      //
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    load();
  }

  Widget list() {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 1, right: 1, top: 5),
      shrinkWrap: true,
      itemCount: _feed.items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _feed.items[index];
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Deneme(item: item)),
                );

                //openFeed(item.link);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: ListTile(
                    leading: CachedNetworkImage(
                      placeholder: (context, url) =>
                          Image.asset(placeholderImg),
                      imageUrl: item.enclosure.url,
                      alignment: Alignment.center,
                      fit: BoxFit.fill,
                    ),
                    title: Text(
                      item.title ?? "title coming",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  bool isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  Widget body() {
    return isFeedEmpty()
        ? Center(
            child: CircleAvatar(),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: list(),
            onRefresh: () async => load(),
          );
  }

  // --------------

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(_feed.items[1]);
    return Scaffold(
        appBar: AppBar(
          //leading: Text(''),
          title: TextField(
            onChanged: (value) {},
            controller: searchController,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.black),
              hintText: "Buradan haber arayabilirsin",
              suffixIcon: IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  print(searchController.text);
                },
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            )
          ],
        ),
        body: body()
        /*SingleChildScrollView(
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            /*Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.grey[100], Colors.blue[400]],
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Text(
                          "merhaba " + email ?? widget.user.email,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),*/
            /*RaisedButton(
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
            )*/
            body(),
          ],
        ),
      ),*/
        );
  }
}

class Deneme extends StatelessWidget {
  final item;
  const Deneme({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              Share.share(item.link);
            },
          )
        ],
      ),
      body: WebView(
        initialUrl: item.link,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
