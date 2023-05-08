import 'package:ahhf_app/screens/admin_screen.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {


  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  bool isLoading =false;
  String password='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
          ),
          Container(
            height: 67,
            width: 179,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/full_logo_black.png'),
                  fit: BoxFit.cover),
            ),
          ),
          const Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter Admin Password',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),


                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          password=value;

                        });
                      },

                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "password",
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 32.0,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    setState(() {
                      isLoading=true;
                    });
                    if(password == 'admin@123'){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> AdminPortalScreen()));
                      setState(() {
                        isLoading=true;
                      });
                    }
                    else{
                      setState(() {
                        isLoading=false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Please Enter Valid Password'),
                          backgroundColor: Colors.red.withOpacity(0.9),
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 2),
                        ),
                      );

                    }
                  },
                  child: isLoading
                      ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                      : Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFFFFFFFF)),
                  )),
            ),
          ),
          const Spacer(flex:2,),
        ],
      ),
    );;
  }
}
