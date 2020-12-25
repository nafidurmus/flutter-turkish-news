import 'package:flutter/material.dart';

import '../constants.dart';
import 'home_page.dart';
import 'sign_in.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayarlar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Text(
                      'Lisanslar',
                      style: style,
                    ),
                    onTap: () {
                      showLicensePage(
                        context: context,
                        // applicationIcon: Image.asset(name)
                        //applicationName: "App Name"
                        // Other parameters
                      );
                    },
                  ),
                  InkWell(
                    child: Text(
                      'Geliştirici',
                      style: style,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'FlutterNews v1',
                    style: style,
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
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
