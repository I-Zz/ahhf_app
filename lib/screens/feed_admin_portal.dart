import 'dart:ffi';

import 'package:ahhf_app/provider/userAuth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../provider/admin.dart';
import '../provider/feed_admin.dart';

class FeedAdminScreen extends StatefulWidget {
  static const String id = '/feed_admin_screen';
  String? adminId;
  String? title;
  String? datetime;
  String? description;
  String? eventUrl;
  String? feedimageUrl;
  String? _projectID;
  String? _likes;

  FeedAdminScreen(this.adminId, this.title, this.datetime, this.description,
      this.eventUrl, this.feedimageUrl, this._projectID, this._likes);

  @override
  State<FeedAdminScreen> createState() => _FeedAdminScreenState(eventUrl);
}

class _FeedAdminScreenState extends State<FeedAdminScreen> {
  // final String? userName;
  // final String? userEmail;
  String? eventUrl;

  // _EditProfileScreenState(this.userName, this.userEmail);
  _FeedAdminScreenState(this.eventUrl);

  // late TextEditingController _nameTextController;
  // late TextEditingController _emailTextController;
  // late TextEditingController _dobTextController;
  // late TextEditingController _bloodGroupTextController;
  // late TextEditingController _addressTextController;()

  //late final ImageUrlEditingController _eventimageUrlEditingController = ImageUrlEditingController(Image.network(widget.userImageUrl))

  late final TextEditingController _titleTextController =
      TextEditingController(text: widget.title);
  late final TextEditingController _datetimeTextController =
      TextEditingController(text: widget.datetime);

  late final TextEditingController _descriptionTextController =
      TextEditingController(text: widget.description);
  late final TextEditingController _feedimageUrlTextController =
      TextEditingController(text: widget.feedimageUrl);
  late final TextEditingController _likesTextController =
      TextEditingController(text: widget._likes);
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

    void onSubmit() {
      //print(_addressTextController.text);
      Map<String, dynamic> feedData = {
        'title': _titleTextController.text,
        'datetime': _datetimeTextController.text,

        'description': _descriptionTextController.text,

        'feedimageUrl': _feedimageUrlTextController.text,
        'likes': _likesTextController.text,
        //'bloodGroup': _bloodGroupTextController.text,
        //'address': _addressTextController.text,
        //'dob': _dobTextController.text,
      };
      Provider.of<AdminFeed>(context, listen: false)
          .addfeedData(feedData, widget.adminId);
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
              'Admin Feed Screen',
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
                                backgroundImage: NetworkImage(eventPhotoUrl),

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
                    ),
                    Positioned(
                        bottom: 25,
                        right: 130,
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
                  "title",

                  Icons.title_rounded,
                  false,
                  _titleTextController,
                  widget.title,
                  // null,
                ),
                reusableTextField(
                  "datetime",

                  Icons.date_range_rounded,
                  false,
                  _datetimeTextController,
                  widget.datetime,
                  // null,
                ),

                reusableTextField(
                  "description",
                  Icons.description_rounded,
                  false,
                  _descriptionTextController,
                  widget.description,
                  // null,
                ),

                reusableTextField(
                  "feedimageUrl",
                  Icons.image,
                  false,
                  _feedimageUrlTextController,
                  // null,
                  widget.feedimageUrl,
                ),
                reusableTextField(
                  "total likes",

                  Icons.title_rounded,
                  false,
                  _likesTextController,
                  widget._likes,
                  // null,
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
