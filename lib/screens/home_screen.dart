import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          //1-widget
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                color: Colors.yellow,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  height: 50,
                  width: 50,
                  color: Colors.red,
                ),
              ),

              Container(
                height: 160,
                width: 160,
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  'Hello world!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                height: 160,
                width: 160,
                color: Colors.red,
                alignment: Alignment.center,
                child: Icon(Icons.waving_hand,color: Colors.white),
              )
            ],
          ),

          // 2-widget
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 40,
                width: 40,
                color: Colors.red,
              ),
              Container(
                height: 60,
                width: 60,
                color: Colors.yellow,
              ),
              Container(
                height: 80,
                width: 80,
                color: Colors.green,
              )
            ],
          )

          //container
          //column
          //row
          //text
          //padding
          //icon

        ],
      ),
    );
  }
}
