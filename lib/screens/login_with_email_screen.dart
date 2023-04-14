import 'package:ahhf_app/screens/home.dart';
import 'package:ahhf_app/screens/tabs_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

final _formkey = GlobalKey<FormState>();
final _emailcontroller = TextEditingController();
final _passwordcontroller = TextEditingController();
final _auth = FirebaseAuth.instance;
bool showspinner = false;

String? errorMessage;

class LoginWithEmail extends StatefulWidget {
  static const String id = 'LoginWithEmail';

  const LoginWithEmail({Key? key}) : super(key: key);

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  void Signin({
    required String email,
    required String password,
  }) async {
    if (_formkey.currentState!.validate()) {
      try {
        setState(() {
          showspinner = true;
        });
        _formkey.currentState!.save();

        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((Uid) => {
                  showspinner = false,
                  _formkey.currentState!.reset(),
                  _emailcontroller.clear(),
                  _passwordcontroller.clear(),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => TabsScreen())),
                });
      } on FirebaseAuthException catch (error) {
        _formkey.currentState!.reset();
        _emailcontroller.clear();
    _passwordcontroller.clear();
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        setState(() {
          showspinner = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage!),
            backgroundColor: Colors.red.withOpacity(0.9),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            behavior: SnackBarBehavior.floating,
            duration: Duration(seconds: 2),


          ),
        );


        // print(error.code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Icon(Icons.email_rounded),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'Email ID',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _emailcontroller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Email Id ";
                  }
                  return null;
                },
                onSaved: (value) {
                  _emailcontroller.text = value!;
                },
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Password";
                  }
                  return null;
                },
                controller: _passwordcontroller,
                onSaved: (value) {
                  _passwordcontroller.text = value!;
                },
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(Icons.lock_rounded),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Icon(Icons.remove_red_eye),
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: ElevatedButton(

                style:
                    ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF428FD4),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 2,
                      padding: EdgeInsets.symmetric(vertical: 16.0),

                    ),
                onPressed: () {
                  setState(() {
                    Signin(
                        email: _emailcontroller.text,
                        password: _passwordcontroller.text);
                  });
                },
                child: showspinner ? CircularProgressIndicator(color: Colors.white,) : Text('Login',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
