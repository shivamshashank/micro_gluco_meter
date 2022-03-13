import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarText;
  final List<Widget>? actions;

  const CustomAppBar({
    Key? key,
    required this.appBarText,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(appBarText),
      centerTitle: true,
      actions: actions ?? [],
    );
  }
}
