import 'package:flutter/material.dart';

class New extends StatefulWidget {
  const New({ Key? key }) : super(key: key);

  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "New",
        style: TextStyle(
          fontSize: 25
        ),
      ),
    );
  }
}