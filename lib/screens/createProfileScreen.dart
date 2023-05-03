import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  TextEditingController _nameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Icons.person_outline,
            false,
            _nameTextController,
          ),
          reusableTextField(
            "DOB",
            Icons.person_outline,
            false,
            _nameTextController,
          ),
        ],
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
    cursorColor: Colors.white,
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
        size: 25.0,
      ),
      labelText: text,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.23),
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
