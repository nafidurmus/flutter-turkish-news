import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterStatePage createState() => _RegisterStatePage();
}

class _LoginData {
  String email = '';
  String password = '';
}

class _RegisterStatePage extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıt Ol'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: screenSize.height * 0.35,
            color: Colors.white10,
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: this._formKey,
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
                    width: screenSize.width * 0.30,
                    child: RaisedButton.icon(
                      onPressed: () {},
                      elevation: 1.0,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
