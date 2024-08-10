import 'package:app_aaun/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('login') == true) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (route) => false);
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void login() async {
    final prefs = await SharedPreferences.getInstance();

    if (_formkey.currentState!.validate()) {
      prefs.setBool('login', true);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
          (route) => false);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Login Screen', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40.0),
              TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.blue),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  }),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.blue),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                validator: (value) {
                  if (value == null || value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  // if (value.length < 8) {
                  //   return 'Password must be at least 8 characters';
                  // }
                  // if (!value.contains(RegExp(r'[A-Z]'))) {
                  //   return 'Password must contain at least one uppercase letter';
                  // }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed:
                    // Perform login logic here
                    login,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
