import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:turkish_news/views/news_main_page.dart';
import 'package:turkish_news/views/sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

Pattern _pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regex = RegExp(_pattern);

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş yap'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenSize.height * 0.37,
              color: Colors.white10,
              padding: EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'E-mail'),
                      validator: (value) {
                        if (!(regex.hasMatch(value)))
                          return "Geçerli bir mail adresi giriniz";
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Şifre'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Lütfen bir şifre giriniz';
                        }
                        if (value.length < 6) {
                          return 'Şifreniz 6 karakter uzunluğunda olmalı';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: RaisedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            // geçerli ise yönlerdirme koyulabilir.

                          }
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
              ),
            ),
            Container(
              height: screenSize.height * 0.20,
              width: screenSize.width * 0.90,
              color: Colors.brown[300],
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  Text(
                    'Diğer giriş yöntemleri',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  SizedBox(
                    height: screenSize.height * 0.02,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.65,
                    child: OutlineButton(
                      splashColor: Colors.white,
                      onPressed: () {
                        signInWithGoogle().then((result) {
                          if (result != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return NewsMainPage();
                                },
                              ),
                            );
                          }
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      highlightElevation: 0,
                      borderSide: BorderSide(color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                                image: AssetImage("assets/google_logo.png"),
                                height: 35.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Google ile Giriş',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
