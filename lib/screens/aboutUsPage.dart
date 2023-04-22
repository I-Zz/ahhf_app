import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  TextStyle textStyle1 = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15,
    color: Colors.grey,
  );
  TextStyle textStyle2 = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  TextStyle textStyle3 = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12,
    color: Colors.black,
  );
  TextStyle textStyle4 = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14,
    color: Colors.black,
  );
  BoxDecoration container = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.06),
        blurRadius: 7,
        spreadRadius: 6,
        offset: Offset(0, 0),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 15,
          ),
        ),
        centerTitle: true,
        title: const Text(
          'About Us',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
              color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextButton.icon(
                onPressed: () {
                  const blogLink = "https://approach.org.in/blog/";
                  launch(blogLink);
                },
                icon: Icon(Icons.article_outlined),
                label: Text('Link to our Blog'),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: container,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'OUR VISION STATEMENT',
                      style: textStyle1,
                    ),
                    const Divider(),
                    Text(
                      'Together we can create a better Tommorrow',
                      style: textStyle2,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: container,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'OUR MISSION',
                      style: textStyle1,
                    ),
                    const Divider(),
                    Text(
                      "Approach Helping Hands Foundation's vision is based on similar grounds. Great Nations are not built upon the guidelines of a handful of intelligent men but are formed by the amalgamation of virtues and sacrifices of numerous common men. We call upon the youth of this country to join hands with us and participate in this “Yagnya” and the positive vibes of this Yagnya would create social security, bridge up the socio-economic gaps and contribute in creating a balanced society in various aspects.",
                      style: textStyle3,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: container,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'OUR STORY',
                      style: textStyle1,
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(
                          // Icons.arrow_circle_right,
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "WE STARTED SMALL, NO REALLY...",
                          style: textStyle4,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        Expanded(
                          child: Text(
                            "It all began when our founder, Payal Mujumdar (a class 9 student in 2007) and a few of her friends realised that there are so many poor children who are not able to afford to pay their school fees due to their financial circumstances. So they decided to pool in their pocket money and help these students in whatever way they could.",
                            style: textStyle3,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(
                          // Icons.arrow_circle_right,
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "FIRST STEPS",
                          style: textStyle4,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        Expanded(
                          child: Text(
                            "This group of school kids started growing and they formed Approach Helping Hands — a social group of the youth. The idea was to help maximum people possible through whatever means were available as students.",
                            style: textStyle3,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(
                          // Icons.arrow_circle_right,
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "GROWTH OVER THE YEARS",
                          style: textStyle4,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        Expanded(
                          child: Text(
                            "Starting 2011 we started doing different social events every month. Most of them continue to be followed even today like Blood donation camps, Clothes donation drive, Eco-Ganesh and distribution of Diwali Kits to needy families to name a few.",
                            style: textStyle3,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(
                          // Icons.arrow_circle_right,
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "11 YEARS & APPROACH FOUNDATION",
                          style: textStyle4,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        Expanded(
                          child: Text(
                            "Today we are proud to have more than 100 volunteers (and counting) with several more in our extended family actively working on various issues. We have done more than 290 donations totalling to ₹2,80,000+ to various social causes. We registered as a formal non-governmental organisation on 16th November 2016.",
                            style: textStyle3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: container,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'OUR DIRECTORS',
                      style: textStyle1,
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(
                          // Icons.arrow_circle_right,
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "PAYAL MAJUMDAR",
                          style: textStyle4,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        Expanded(
                          child: Text(
                            "Payal is the founder of Approach and our leader. She has finished her computer engineering from Marathwada Mitramandal College of Engineering and subsequently worked as a System Engineer at Infosys.",
                            style: textStyle3,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(
                          // Icons.arrow_circle_right,
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "PRASAD DIXIT",
                          style: textStyle4,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        Expanded(
                          child: Text(
                            "Prasad Dixit is the second Founder Director of Approach, Director of Vijeta Switchgear and CEO of Yashada Consultants.",
                            style: textStyle3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
