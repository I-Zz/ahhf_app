import 'package:ahhf_app/provider/userAuth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              'Project Details',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                  color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      alignment: Alignment.topCenter,
                      height: 150.0,
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
                      padding: const EdgeInsets.only(top: 60),
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
                                // backgroundImage: Image.network(userImageUrl),
                              ),

                              // CircleAvatar(
                              //   radius: 82,
                              //   // backgroundImage:
                              //   //     AssetImage('assets/images/Profile.png'),
                              //   backgroundImage:
                              //       AssetImage('assets/images/Profile.png'),
                              // ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                reusableTextField(
                  "Name",
                  Icons.person_outline,
                  false,
                  _nameTextController,
                  widget.userName,
                  // null,
                ),
                reusableTextField(
                  "Email",
                  Icons.mail_outline,
                  false,
                  _emailTextController,
                  widget.userEmail,
                  // null,
                ),
                reusableTextField(
                  "Date of Birth",
                  Icons.calendar_month_outlined,
                  false,
                  _dobTextController,
                  // null,
                ),
                reusableTextField(
                  "Blood Group",
                  Icons.water_drop_outlined,
                  false,
                  _bloodGroupTextController,
                  // null,
                ),
                reusableTextField(
                  "Address",
                  Icons.pin_drop_outlined,
                  false,
                  _addressTextController,
                  // null,
                ),
                ElevatedButton(
                  child: Text('CREATE PROFILE'),
                  onPressed: onSubmit,
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
      labelText: text,
      prefixIcon: Icon(
        icon,
        color: Colors.black,
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
