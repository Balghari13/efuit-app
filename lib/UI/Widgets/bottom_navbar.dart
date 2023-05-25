import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatelessWidget {
  final Color iconColor;
  final Color backgroundColour;
  final Color color;
  final String title;
  final IconData iconData;
  const BottomNavBarScreen({Key? key, required this.iconColor, required this.backgroundColour, required this.color, required this.title, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
     decoration: BoxDecoration(
       color: backgroundColour,

     ),
      padding: EdgeInsets.all(20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData,size:17, color: iconColor),
          SizedBox(width: 5,),
          Text(title, style: TextStyle(color: color),)
        ],
      ),
    ));
  }
}
