import 'package:flutter/material.dart';
import 'package:my_profile/providers/theme_provider.dart';
import 'package:my_profile/res/styles.dart';
import 'package:my_profile/views/root/view/root_view.dart';
import 'package:my_profile/views/root/viewModel/root_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => RootViewModel(),
      child: MaterialApp(
        title: 'PublicKSH Profile',
        theme: lightTheme,
        darkTheme: darkTheme,         
        themeMode: themeProvider.themeData,
        home: const RootView(),
      ),
    );
  }
}