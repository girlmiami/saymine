import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:saymine/main.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MainAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.start,
      ),
      iconTheme: IconThemeData(color: Colors.grey),
      actions: [
        TextButton(
          onPressed: () => auth.signOut(),
          child: Text(
            "Logout",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(65.h);
}
