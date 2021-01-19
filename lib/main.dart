import 'package:flutter/material.dart';

import 'di/injector.dart';
import 'features/user/presentation/pages/user_page.dart';

void main() {
  initDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake UserRepository Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UserPage(title: 'Fake UserRepository Example'),
    );
  }
}
