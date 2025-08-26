import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int index = 0;
  List<String> images = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(
                images[index],
                width: double.infinity,
                fit: BoxFit.fitWidth,
                height: MediaQuery.of(context).size.height * 0.55,
              ),
              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Text(
                      'Lorem Ipsum is simply dummy',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color:
                            index == 0 ? Color(0xff1877F2) : Color(0xffA0A3BD),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color:
                            index == 1 ? Color(0xff1877F2) : Color(0xffA0A3BD),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: 14,
                      width: 14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color:
                            index == 2 ? Color(0xff1877F2) : Color(0xffA0A3BD),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (index < 2) {
                      setState(() {
                        index++;
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xff1877F2),
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 24),
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
