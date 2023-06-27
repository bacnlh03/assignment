import 'package:assignment/presentation/screens/home/reps_screen/reps_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: <Widget>[
          TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.w900),
            indicatorColor: Colors.deepOrange,
            tabs: <Widget>[
              Tab(
                text: "Rep's",
              ),
              Tab(
                text: "Articles",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                RepsScreen(),
                Center(
                  child: Text('Articles'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
