import 'package:flutter/material.dart';

class ListTileScreen extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback? onTap;

  const ListTileScreen({Key? key, required this.iconData,
    required this.title, this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          onTap: onTap,
          leading: Icon(iconData),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }
  }

