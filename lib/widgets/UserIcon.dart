import 'package:flutter/material.dart';

class UserIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Center(
          child: IconButton(
            icon: Icon(
              Icons.person,
              size: 25,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
