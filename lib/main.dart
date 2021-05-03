import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_pro_responsive_app/pages/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.grey[850], // From Dark ThemeData.
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        HomePage.routeName: (_) => HomePage(),
      },
      initialRoute: HomePage.routeName,
    );
  }
}
