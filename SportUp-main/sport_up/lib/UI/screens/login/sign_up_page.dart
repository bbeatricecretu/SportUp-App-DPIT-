// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String _surname;
  late String _name;
  late String _email;
  late String _password;

  final surnameController = TextEditingController();
  final nameController = TextEditingController();
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

  Widget _buildSurname() {
    return TextFormField(
      controller: surnameController,
      decoration: InputDecoration(
          hintText: "Surname",
          hintStyle: TextStyle(color: Colors.grey[800]),
          suffixIcon: IconButton(
            icon: Icon(Icons.close),
            color: Colors.grey[800],
            onPressed: () => surnameController.clear(),
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your Surname";
        }
        return null;
      },
      onSaved: (value) {
        _surname = value.toString();
      },
    );
  }

  Widget _buildName() {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
          hintText: "Name",
          hintStyle: TextStyle(color: Colors.grey[800]),
          suffixIcon: IconButton(
            icon: Icon(Icons.close),
            color: Colors.grey[800],
            onPressed: () => nameController.clear(),
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your Name";
        }
        return null;
      },
      onSaved: (value) {
        _name = value.toString();
      },
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
          // if (mailexists) {
          //   return "This email is already used"
          // }
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

  Widget _buildSignUpButton() {
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
            "Register!",
            style: TextStyle(
              fontSize: 18,
            ),
          )),
    );
  }

  Widget _buildSignInRedirection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already a member?",
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]),
        ),
        TextButton(
            onPressed: () => Navigator.pushNamed(context, "/sign_in"),
            child: Text(
              "Go to sign in page!",
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
                  _buildSurname(),
                  _buildName(),
                  _buildMailField(),
                  _buildPasswordField(),
                  SizedBox(
                    height: 40,
                  ),
                  _buildSignUpButton(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildSignInRedirection(),
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
