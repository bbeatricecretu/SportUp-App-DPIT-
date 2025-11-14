// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late String _email;
  late String _password;

  final mailController = TextEditingController();
  final passController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildPretext() {
    return Column(
      children: [
        Text(
          "SportUP",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]),
        )
      ],
    );
  }

  Widget _buildMailField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: mailController,
        decoration: InputDecoration(
            hintText: "Email",
            hintStyle: TextStyle(color: Colors.grey[800]),
            prefixIcon: Icon(
              Icons.mail,
              color: Colors.grey[800],
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              color: Colors.grey[800],
              onPressed: () => mailController.clear(),
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter your email";
          }
          if (!RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value)) {
            return "Please enter a valid email!";
          }
          return null;
        },
        onSaved: (value) {
          _email = value.toString();
        });
  }

  Widget _buildPasswordField() {
    return TextFormField(
        controller: passController,
        decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.grey[800]),
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey[800],
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.close),
              color: Colors.grey[800],
              onPressed: () => passController.clear(),
            )),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a password";
          }
          if (value.length < 8) {
            return "Password is too short!";
          }
          return null;
        },
        onSaved: (value) {
          _password = value.toString();
        });
  }

  Widget _buildSignInButton() {
    return Container(
      height: 45,
      width: 180,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.blue),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              //put data in database
            }
          },
          child: Text(
            "Sign In!",
            style: TextStyle(
              fontSize: 18,
            ),
          )),
    );
  }

  Widget _buildSignUpRedirection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Not a member yet?",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]),
        ),
        TextButton(
            onPressed: () => Navigator.pushNamed(context, "/sign_up"),
            child: Text(
              "Register now!",
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(24),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildPretext(),
                  SizedBox(
                    height: 100,
                  ),
                  _buildMailField(),
                  _buildPasswordField(),
                  SizedBox(
                    height: 40,
                  ),
                  _buildSignInButton(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildSignUpRedirection(),
                  SizedBox(
                    height: 80,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
