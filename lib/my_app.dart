import 'package:flutter/material.dart';

import 'package:pokeapp/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const MyHomePage());
  }
}
