import 'package:flutter/material.dart';
import 'package:turkish_news/views/register_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Flutter-Turkish News'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Placeholder(),
                      ))),
              Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 2.0,
                  )),
              Expanded(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Placeholder(),
                      ))),
            ],
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  color: Colors.blue,
                  icon: Icon(Icons.person_add),
                  label: Text(
                    "Kayıt ol",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: RaisedButton.icon(
                  onPressed: () {
                    print('giriş yap');
                  },
                  elevation: 2.0,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0),
                  ),
                  color: Colors.orangeAccent,
                  icon: Icon(Icons.login),
                  label: Text(
                    "Giriş Yap",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
