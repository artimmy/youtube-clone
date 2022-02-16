import 'package:flutter/material.dart';

class Library extends StatefulWidget {
  const Library({ Key? key }) : super(key: key);

  @override
  _LibraryState createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Library",
        style: TextStyle(
          fontSize: 25
        ),
      ),
    );
  }
}