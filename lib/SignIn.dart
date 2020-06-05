import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginapp/Home.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key key,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();  
  String _email, _password;
  bool _ishidden = true;
  Color _eyebutton = Colors.grey;


Padding buildTitle(){
  return Padding(
            padding: const EdgeInsets.all(8.0),
              child: Text('Login', style: TextStyle(fontSize: 60.0),)
            );
  }

Padding buildTitleLine(){
  return Padding(
          padding: const EdgeInsets.only(top: 0.0, left: 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
                child: Container(
                  width: 38.0,
                  height: 1.5,
                  color: Colors.black,            
                ),
              ),
          );
  }

TextFormField buildEmailTextField(){
return TextFormField(
                  validator: (input) {
                    if(input.isEmpty){
                        return 'Please enter the email';
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(
                    labelText: 'Email Address'
                  ),
                );  
  }

TextFormField buildPasswordTextField(){
return TextFormField(
                  validator: (input) {
                    if(input.length < 6){
                        return 'Please enter the password';
                    }
                    else{
                      return null;
                    }
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye, color: _eyebutton), 
                      onPressed: () {
                        if(_ishidden){
                          setState(() {
                            _ishidden = false;
                            _eyebutton = Theme.of(context).primaryColor;
                          });
                        }
                        else{
                          setState(() {
                            _ishidden = true;
                            _eyebutton = Colors.grey;
                          });
                        }
                      },
                    ),
                  ),
                  obscureText: _ishidden,
                );  
  }

Align buildButton(){
  return Align(
              child: SizedBox(
                height:50.0,
                width:270.0,
                child:RaisedButton(
                  onPressed: () {

                  },
                  child: Text('LOGIN', style: TextStyle(color: Colors.white),),
                  color: Colors.grey[900],
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),  
              ),  
            );
}

Padding buidForgotPass(){
return Padding(
              padding: const EdgeInsets.only(top: 8.0), 
              child:Align(
                alignment: Alignment.centerRight,
                child: Text('Forgot Password?', style: TextStyle(fontSize: 12.0, color: Colors.grey),),
              ),
            );
}

Align buildOrLogin(){
return Align(
              alignment: Alignment.center,
              child: Text('or Login with', style: TextStyle(fontSize: 14.0, color: Colors.grey),),
            );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey ,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22.0, 10, 22.0, 22.0),
          children: <Widget>[
            SizedBox(height: kToolbarHeight,),
            buildTitle(),
            buildTitleLine(),
            SizedBox(height: 90.0,),
            buildEmailTextField(),
            SizedBox(height: 30.0,),
            buildPasswordTextField(),
            buidForgotPass(),
            SizedBox(height: 60.0,),
            buildButton(),
            SizedBox(height: 35.0,),
            buildOrLogin(),
            SizedBox(height: 16.0,),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    height: 46.0,
                    width: 46.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 0.5),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }catch(e){
        print(e.message);
      }
      
    }
  }

 
}