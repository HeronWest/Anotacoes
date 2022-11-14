import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text('ANOTAÇÕES', style: TextStyle(color: Colors.white),),
      backgroundColor: Colors.brown,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

