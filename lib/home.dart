import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: const Text("Youtobs"),
        actions:  <Widget>[
          IconButton(
            onPressed: ()
            {
              debugPrint("video cam");
            }, 
            icon: const Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: ()
            {
              debugPrint("search");
            }, 
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: ()
            {
              debugPrint("account");
            }, 
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Container(),
    );
  }
}