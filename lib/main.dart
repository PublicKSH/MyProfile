import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
        routes: [
          GoRoute(
            path: 'child1',
            builder: (context, state) => ChildPage1(),
            routes: [
              GoRoute(
                path: 'child2',
                builder: (context, state) => ChildPage2(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'GoRouter Example',
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/child1');
          },
          child: Text('Go to Child Page 1'),
        ),
      ),
    );
  }
}

class ChildPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Page 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.go('/child1/child2');
          },
          child: Text('Go to Child Page 2'),
        ),
      ),
    );
  }
}

class ChildPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Page 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pop();
          },
          child: Text('Go Back to Child Page 1'),
        ),
      ),
    );
  }
}
