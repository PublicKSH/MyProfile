import 'package:flutter/material.dart';


class DefaultScaffold extends StatelessWidget {
  final Widget body;
  const DefaultScaffold(
      {super.key,
    
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
    );
  }
}
