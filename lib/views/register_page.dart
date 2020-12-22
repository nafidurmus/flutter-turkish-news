import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterStatePage createState() => _RegisterStatePage();
}

Pattern _pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regex = RegExp(_pattern);

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
            height: screenSize.height * 0.40,
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
                    width: screenSize.width * 0.30,
                    child: RaisedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          // geçerli ise yönlerdirme koyulabilir.

                        }
                      },
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
