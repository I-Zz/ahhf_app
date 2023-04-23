import 'dart:ffi';

import 'package:ahhf_app/provider/userAuth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  static const String id = '/edit_profile_screen';
  String? userId;
  String? userName;
  String? userEmail;
  String? userImageUrl;

  EditProfileScreen(
      this.userId, this.userName, this.userEmail, this.userImageUrl);

  @override
  State<EditProfileScreen> createState() =>
      _EditProfileScreenState(userImageUrl);
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // final String? userName;
  // final String? userEmail;
  String? userImageUrl;

  // _EditProfileScreenState(this.userName, this.userEmail);
  _EditProfileScreenState(this.userImageUrl);

  // late TextEditingController _nameTextController;
  // late TextEditingController _emailTextController;
  // late TextEditingController _dobTextController;
  // late TextEditingController _bloodGroupTextController;
  // late TextEditingController _addressTextController;

  late final TextEditingController _nameTextController =
      TextEditingController(text: widget.userName);
  late final TextEditingController _emailTextController =
      TextEditingController(text: widget.userEmail);
  final TextEditingController _dobTextController = TextEditingController();
  final TextEditingController _bloodGroupTextController =
      TextEditingController();
  final TextEditingController _addressTextController = TextEditingController();

  // @override
  // void initState() {

  //   _nameTextController = TextEditingController(text: widget.userName);
  //   _emailTextController = TextEditingController(text: widget.userEmail);
  //   _dobTextController = TextEditingController();
  //   _bloodGroupTextController = TextEditingController();
  //   _addressTextController = TextEditingController();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    print(widget.userName);
    final String userPhotoUrl;
    if (userImageUrl != null) {
      userPhotoUrl = userImageUrl!;
    } else {
      userPhotoUrl =
          'https://www.pngitem.com/pimgs/m/581-5813504_avatar-dummy-png-transparent-png.png';
    }

    void onSubmit() {
      print(_addressTextController.text);
      Map<String, dynamic> userData = {
        'name': _nameTextController.text,
        'email': _emailTextController.text,
        'imageUrl': userImageUrl,
        'bloodGroup': _bloodGroupTextController.text,
        'address': _addressTextController.text,
        'dob': _dobTextController.text,
      };
      Provider.of<CurrentUser>(context, listen: false)
          .editUserData(userData, widget.userId);
    }

    return ChangeNotifierProvider.value(
      value: CurrentUser(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(245, 245, 245, 1),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 15,
              ),
            ),
            centerTitle: true,
            title: Text(
              'Edit Profile',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                  color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      alignment: Alignment.topCenter,
                      height: 100.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.06),
                              blurRadius: 5,
                              offset: const Offset(0, 10))
                        ],
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                      //child: Image.asset("assets/bgImage.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // (userImageUrl == null)
                              //     ? CircleAvatar(
                              //         radius: 82,
                              //         // backgroundImage:
                              //         //     AssetImage('assets/images/Profile.png'),
                              //         backgroundImage:
                              //             AssetImage('assets/images/Profile.png'),
                              //       )
                              //     : CircleAvatar(
                              //         radius: 82,
                              //         backgroundColor: Colors.grey,
                              //         // backgroundImage:
                              //         //     AssetImage('assets/images/Profile.png'),
                              //         backgroundImage:
                              //             NetworkImage(userImageUrl as String),
                              //       ),

                              CircleAvatar(
                                radius: 82,
                                backgroundColor: Colors.grey,
                                // backgroundImage:
                                //     AssetImage('assets/images/Profile.png'),
                                backgroundImage: NetworkImage(userPhotoUrl),
                                child: Column(
                                  children: [
                                    const Spacer(),
                                    Row(
                                      children: [
                                        const Spacer(),
                                        Container(
                                          height: 26,
                                          width: 26,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              shape: BoxShape.rectangle,
                                              color: Color.fromRGBO(
                                                  66, 143, 212, 1)),
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                ),

                                // backgroundImage: Image.network(userImageUrl),
                              ),

                              // CircleAvatar(
                              //   radius: 82,
                              //   // backgroundImage:
                              //   //     AssetImage('assets/images/Profile.png'),
                              //   backgroundImage:
                              //       AssetImage('assets/images/Profile.png'),
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Positioned(
                    //   bottom: 25,
                    //   right: 130,
                    //   child: Container(
                    //     height: 26,
                    //     width: 26,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.all(Radius.circular(5)),
                    //         shape: BoxShape.rectangle,
                    //         color: Color.fromRGBO(66, 143, 212, 1)),
                    //     child: Icon(
                    //       Icons.edit,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Personal',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 26,
                        ),
                      ),
                      // const SizedBox(height: 16),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                          bottom: 5,
                          left: 8,
                        ),
                        child: Text(
                          'Name',
                          style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1),
                          ),
                        ),
                      ),
                      // const SizedBox(height: 5),
                      reusableTextField(
                        "John Doe",
                        Icons.person_outline,
                        false,
                        _nameTextController,
                        widget.userName,
                        // null,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                          bottom: 5,
                          left: 8,
                        ),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1),
                          ),
                        ),
                      ),
                      reusableTextField(
                        "john@gmail.com",
                        Icons.mail_outline,
                        false,
                        _emailTextController,
                        widget.userEmail,
                        // null,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                          bottom: 5,
                          left: 8,
                        ),
                        child: Text(
                          'Date of Birth',
                          style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1),
                          ),
                        ),
                      ),
                      reusableTextField(
                        "1-Jan-1990",
                        Icons.calendar_month_outlined,
                        false,
                        _dobTextController,
                        // null,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                          bottom: 5,
                          left: 8,
                        ),
                        child: Text(
                          'Blood Group',
                          style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1),
                          ),
                        ),
                      ),
                      reusableTextField(
                        "O+",
                        Icons.water_drop_outlined,
                        false,
                        _bloodGroupTextController,
                        // null,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 16,
                          bottom: 5,
                          left: 8,
                        ),
                        child: Text(
                          'Address',
                          style: TextStyle(
                            color: Color.fromRGBO(130, 130, 130, 1),
                          ),
                        ),
                      ),
                      reusableTextField(
                        "Pune, Maharashtra, India",
                        Icons.pin_drop_outlined,
                        false,
                        _addressTextController,
                        // null,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          //children: <Widget>[
                          //const Spacer(),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(66, 143, 212, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(42),
                              ),
                            ),
                            child: Text('SAVE DETAILS'),
                            onPressed: onSubmit,
                          ),
                          //],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// TextField reusableTextField(String text, IconData icon, bool isPasswordType,
TextFormField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller,
    [String? initialText]) {
  return TextFormField(
    initialValue: initialText,
    // controller: controller,
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: text,
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      prefixIcon: Icon(
        icon,
        color: Colors.grey,
        size: 25.0,
      ),
    ),
    onFieldSubmitted: (value) {
      controller.text = value;
    },

    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );

  // return TextField(
  //   controller: controller,
  //   obscureText: isPasswordType,
  //   enableSuggestions: !isPasswordType,
  //   autocorrect: !isPasswordType,
  //   cursorColor: Colors.black,
  //   style: TextStyle(
  //     fontWeight: FontWeight.bold,
  //     color: Colors.black,
  //   ),
  //   decoration: InputDecoration(
  //     prefixIcon: Icon(
  //       icon,
  //       color: Colors.black,
  //       size: 25.0,
  //     ),
  //     labelText: text,
  //     labelStyle: TextStyle(
  //       fontWeight: FontWeight.bold,
  //       color: Colors.black,
  //     ),
  //     filled: true,
  //     floatingLabelBehavior: FloatingLabelBehavior.never,
  //     // fillColor: Colors.white.withOpacity(0.23),
  //     fillColor: Colors.black.withOpacity(0.23),
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(20.0),
  //       borderSide: const BorderSide(width: 0, style: BorderStyle.none),
  //     ),
  //   ),
  //   keyboardType: isPasswordType
  //       ? TextInputType.visiblePassword
  //       : TextInputType.emailAddress,
  // );
}
