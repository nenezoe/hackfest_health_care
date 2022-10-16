
import 'package:flutter/material.dart';

import '../widgets/onboarding_screen.dart';
import 'home_screen.dart';


class FirstScreen extends StatefulWidget {
  // static const routeName = '/first-screen';

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  static const routeName = '/first-screen';
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(contents[i].title,  style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                        Text(contents[i].description,  style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),),
                        Center(child: Image.asset(contents[i].image, height: 220,))
                      ],
                    ),
                  ),
                  // child: Column(
                  //   children: [
                  //     Image.asset(
                  //       contents[i].image,
                  //       height: 100,
                  //     ),
                  //     Text(
                  //       contents[i].title,
                  //       style: TextStyle(
                  //         fontSize: 25,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     SizedBox(height: 20),
                  //     Text(
                  //       contents[i].description,
                  //       textAlign: TextAlign.center,
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         color: Colors.grey,
                  //       ),
                  //     )
                  //   ],
                  // ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                          (index) => buildDot(index, context),
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.all(40),
                  child: FlatButton(
                    child: Text(
                        currentIndex == contents.length - 1 ? "Continue" : "Next"),
                    onPressed: () {
                      if (currentIndex == contents.length - 1) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          ),
                        );
                      }
                      _controller.nextPage(
                        duration: Duration(milliseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),

        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
    );
  }
}