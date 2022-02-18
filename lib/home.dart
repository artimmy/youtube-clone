import 'package:flutter/material.dart';
import 'package:youtube_clone/screens/app_home.dart';
import 'package:youtube_clone/screens/library.dart';
import 'package:youtube_clone/screens/new.dart';
import 'package:youtube_clone/screens/subscriptions.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Index integer to be used on the BottomNavigationBar
  int _navBarIndex = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      const AppHome(),
      const New(),
      const Subscriptions(),
      const Library(),
    ];

    return Scaffold(

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions:  <Widget>[
          IconButton(
            onPressed: ()
            {
              debugPrint("video");
            }, 
            icon: const Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: ()
            {
              debugPrint("Search");
            }, 
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: ()
            {
              debugPrint("Account");
            }, 
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),

      body: Container(
        padding: const EdgeInsets.all(16),
        child: screens[_navBarIndex],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navBarIndex,
        onTap: (index)
        {
          setState(()
          {
            _navBarIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot), 
            label: "New",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions), 
            label: "Subscriptions",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library), 
            label: "Library",
          ),
        ],
      ),

    );
  }
}