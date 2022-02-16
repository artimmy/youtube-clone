import 'package:flutter/material.dart';
import 'package:youtube_clone/api.dart';

class AppHome extends StatefulWidget {
  const AppHome({ Key? key }) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  @override
  Widget build(BuildContext context) {
    
    Api api = Api();
    api.search("");

    return const Center(
      child: Text(
        "Home",
        style: TextStyle(
          fontSize: 25
        ),
      ),
    );
  }
}