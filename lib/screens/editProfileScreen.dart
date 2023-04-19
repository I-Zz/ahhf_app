import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  static const String id = '/edit_profile_screen';

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _dobTextController = TextEditingController();
  TextEditingController _bloodGroupTextController = TextEditingController();
  TextEditingController _addressTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            reusableTextField(
              "Name",
              Icons.person_outline,
              false,
              _nameTextController,
            ),
            reusableTextField(
              "Email",
              Icons.mail_outline,
              false,
              _emailTextController,
            ),
            reusableTextField(
              "Date of Birth",
              Icons.calendar_month_outlined,
              false,
              _dobTextController,
            ),
            reusableTextField(
              "Blood Group",
              Icons.water_drop_outlined,
              false,
              _bloodGroupTextController,
            ),
            reusableTextField(
              "Address",
              Icons.pin_drop_outlined,
              false,
              _addressTextController,
            ),
          ],
        ),
      ),
    );
  }
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.black,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
        size: 25.0,
      ),
      labelText: text,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      // fillColor: Colors.white.withOpacity(0.23),
      fillColor: Colors.black.withOpacity(0.23),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(width: 0, style: BorderStyle.none),
      ),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}
