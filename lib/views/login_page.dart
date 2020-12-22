import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //valitation ekle
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş yap'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: screenSize.height * 0.31,
            color: Colors.white10,
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'E-mail'),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(labelText: 'Şifre'),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: RaisedButton.icon(
                      onPressed: () {},
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
            height: screenSize.height * 0.18,
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
                  height: screenSize.height * 0.04,
                ),
                SizedBox(
                  width: screenSize.width * 0.45,
                  child: RaisedButton.icon(
                    onPressed: () {},
                    elevation: 2.0,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0),
                    ),
                    color: Colors.white,
                    icon: Icon(Icons.g_translate),
                    label: Text(
                      "Google ile giriş yap",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
