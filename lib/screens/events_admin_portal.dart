import 'dart:io';

import 'package:ahhf_app/provider/userAuth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import '../provider/admin.dart';
import 'feed_admin_portal.dart';
import '../screens/feed_admin_portal.dart';
import '../provider/feed_admin.dart';

class EventAdminPortal extends StatefulWidget {
  static const String id = '/edit_profile_screen';
  String? adminId;
  String? title;
  String? dateTime;
  //String? description;
  String? eventUrl;
  String? eventimageUrl;
  String? projectID;
  String? venue;

  EventAdminPortal(this.adminId, this.title, this.dateTime, this.eventUrl,
      this.eventimageUrl, this.projectID, this.venue);

  @override
  State<EventAdminPortal> createState() => _EventAdminPortalState(eventUrl);
}

class _EventAdminPortalState extends State<EventAdminPortal> {
  // final String? userName;
  // final String? userEmail;
  String? eventUrl;

  // _EditProfileScreenState(this.userName, this.userEmail);
  _EventAdminPortalState(this.eventUrl);

  // late TextEditingController _nameTextController;
  // late TextEditingController _emailTextController;
  // late TextEditingController _dobTextController;
  // late TextEditingController _bloodGroupTextController;
  // late TextEditingController _addressTextController;()

  //late final ImageUrlEditingController _eventimageUrlEditingController = ImageUrlEditingController(Image.network(widget.userImageUrl))
  late final TextEditingController _dateTimeTextController =
      TextEditingController(text: widget.dateTime);

  late final TextEditingController _titleTextController =
      TextEditingController(text: widget.title);
  late final TextEditingController _projectIDTextController =
      TextEditingController(text: widget.projectID);
  late final TextEditingController _venueTextController =
      TextEditingController(text: widget.venue);
  late final TextEditingController _eventimageUrlTextController =
      TextEditingController(text: widget.eventimageUrl);
  //final TextEditingController _dobTextController = TextEditingController();
  //final TextEditingController _bloodGroupTextController =
  //TextEditingController();
  //final TextEditingController _addressTextController = TextEditingController();

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
    File? eventImage;
  @override
  Widget build(BuildContext context) {
    print(widget.title);
    final String eventPhotoUrl;
    if (eventUrl != null) {
      eventPhotoUrl = eventUrl!;
    } else {
      eventPhotoUrl =
          'https://www.pngitem.com/pimgs/m/581-5813504_avatar-dummy-png-transparent-png.png';
    }

    Future<String> uploadImage()async{
      final uploadImageref = FirebaseStorage.instance
          .ref()
          .child('events')
          .child(_titleTextController.text + '.jpg');

      await uploadImageref.putFile(eventImage!);
      final imageUrl =await uploadImageref.getDownloadURL();
      return imageUrl;
    }

    void onSubmit() async{

      final imageUrl = await uploadImage();

      Map<String, dynamic> eventData = {
        'dateTime': _dateTimeTextController.text,
        'imageUrl': imageUrl,
        'projectID': _projectIDTextController.text,
        'title': _titleTextController.text,
        'venue': _venueTextController.text,

        //'description': _descriptionTextController.text,
        //'bloodGroup': _bloodGroupTextController.text,
        //'address': _addressTextController.text,
        //'dob': _dobTextController.text,
      };
      Provider.of<AdminEvent>(context, listen: false)
          .addEventData(eventData, widget.adminId);
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
              'ADMIN PORTAL : AdminPortalScreen',
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


                      ClipOval(
                      child: Container(
                        width: 164,
                        height: 164,
                        child: eventImage!=null ? Image.file(eventImage!,fit: BoxFit.cover,): Text(''),

                      ),
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
                    ),
                    Positioned(
                        bottom: 25,
                        right: 10,
                        child: GestureDetector(
                          onTap: ()async{
                            final picker= ImagePicker();
                            final pickedImage= await picker.pickImage(source: ImageSource.gallery);
                            setState(() {
                              eventImage= File(pickedImage!.path);
                            });

                          },
                          child: Container(
                            height: 24,
                            width: 24,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                shape: BoxShape.rectangle,
                                color: Color.fromRGBO(66, 143, 212, 1)),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        )),
                    //Padding(padding: EdgeInsets.all(24))
                  ],
                ),
                // Container(
                //   margin: const EdgeInsets.all(15),
                //   padding: const EdgeInsets.all(3),
                //   decoration:
                //       BoxDecoration(border: Border.all(color: Colors.grey)),
                //   child:
                reusableTextField(
                  "dateTime",

                  Icons.title_rounded,
                  false,
                  _dateTimeTextController,
                  widget.dateTime,
                  // null,
                ),

                reusableTextField(
                  "projectID",

                  Icons.title_rounded,
                  false,
                  _projectIDTextController,
                  widget.projectID,
                  // null,
                ),

                reusableTextField(
                  "title",

                  Icons.title_rounded,
                  false,
                  _titleTextController,
                  widget.title,
                  // null,
                ),

                reusableTextField(
                  "venue",
                  Icons.image,
                  false,
                  _venueTextController,
                  // null,
                  widget.venue,
                ),

                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 50,
                    width: 300,
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
                TextButton(onPressed: () {}, child: Text('Admin Feed')),
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

  //ilAddress,
  // );
}
