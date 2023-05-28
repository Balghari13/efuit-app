import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatelessWidget {
  final Color iconColor;
  final Color backgroundColour;
  final Color color;
  final String title;
  final IconData iconData;
  VoidCallback onTap;
   BottomNavBarScreen({Key? key,
    required this.iconColor, required this.onTap,
    required this.backgroundColour, required this.color, required this.title, required this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: InkWell(
      onTap: onTap,
      child: Container(
       decoration: BoxDecoration(
         color: backgroundColour,

       ),
        padding: EdgeInsets.all(20),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData,size:25, color: iconColor),
            SizedBox(width: 10,),
            Text(title, style: TextStyle(color: color, fontSize: 24),)
          ],
        ),
      ),
    ));
  }
}
