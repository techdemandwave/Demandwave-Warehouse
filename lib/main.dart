import 'package:dw_warehouse/provider/login_provider.dart';
import 'package:dw_warehouse/screen/home_screen.dart';
import 'package:dw_warehouse/screen/inwarding_screen.dart';
import 'package:dw_warehouse/screen/login_screen.dart';
import 'package:dw_warehouse/screen/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => LoginProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter ',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home:
            HomeScreen(), //Constants.user != null ? HomeScreen() : LoginScreen(),
        routes: {
          HomeScreen.route: (context) => HomeScreen(),
          LoginScreen.route: (context) => LoginScreen(),
          TasksScreen.route: (context) => TasksScreen(),
          InwardingScreen.route: (context) => InwardingScreen(),
        },
      ),
    );
  }
}
