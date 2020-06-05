import 'package:flutter/material.dart';
import 'package:loginapp/SignIn.dart';
import 'package:loginapp/SignUp.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:     
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
              onPressed: navigateToSignIn,
              child: Text('Sign In'),
              color: Colors.blueAccent,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              padding: EdgeInsets.all(12.0),
            ),
            RaisedButton(
              onPressed: navigateToSignUp,
              child: Text('Sign up'),
              color: Colors.blueAccent,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
              ),
              padding: EdgeInsets.all(12.0),
            ),
        ],
      ),

    );
  }
  void navigateToSignIn(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),fullscreenDialog: true));
  }
  void navigateToSignUp(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),fullscreenDialog: true));
  }
}
