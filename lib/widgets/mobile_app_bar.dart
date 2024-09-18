import 'package:flutter/material.dart';
import 'package:my_profile/providers/theme_provider.dart';
import 'package:my_profile/res/color.dart';
import 'package:provider/provider.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return AppBar(
      elevation: 0,
      leading: Icon(Icons.logo_dev, color: themeProvider.isDartMode() ? white : black),
      actions: [
        IconButton(
          icon: Icon(Icons.menu, color: themeProvider.isDartMode() ? white : black),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
