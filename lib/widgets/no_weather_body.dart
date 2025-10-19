import 'package:flutter/material.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("there is no weather 😌 start", style: TextStyle(fontSize: 30)),
          Text("searching now 🔍", style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
