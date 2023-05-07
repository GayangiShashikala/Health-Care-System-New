import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:health_care_system/Pages/login_page.dart';
import 'package:health_care_system/Welcome%20Section/page3.dart';
import 'package:health_care_system/Welcome%20Section/page_2.dart';
import 'package:health_care_system/auth/main_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Welcome Section/page1.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  //Page Controller
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 500,
            child: PageView(
              controller: _pageController,
              children: const [
                page1(),
                page_2(),
                page3()

              ],
            ),
          ),

          //Dot Indicator
          SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: JumpingDotEffect(
                activeDotColor: Colors.teal,
                dotColor: Colors.teal.shade200,
                dotHeight: 12,
                dotWidth: 13,
                spacing: 16
            ),
          ),


//SignIn Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 60),
            child: MaterialButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    MainPage()
                ),
              );
            },
              color: Colors.teal[300],
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              child: const Center(child: Text("Sign In",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

page2() {
}
