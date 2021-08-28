import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Sliver Appbar Header'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Text('Hello');
            }, childCount: 50),
          ),
          // SliverFillRemaining(
          //   child: Text(
          //     'Home ',
          //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          //   ),
          // ),
        ],
      ),
    );
  }
}
