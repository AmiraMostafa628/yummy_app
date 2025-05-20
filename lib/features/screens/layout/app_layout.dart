import 'package:flutter/material.dart';
import 'package:yummy_app/core/resources/constants.dart';
import 'package:yummy_app/features/screens/views/yummy_view.dart';


class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  ThemeMode themeChange = ThemeMode.light;
  ColorSelection colorChangedValue = ColorSelection.blue;
  void changeTheme(){
    setState(() {
      themeChange =  themeChange == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  void changeColor(int value) {
    setState(() {
      colorChangedValue = ColorSelection.values[value];
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeChange,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: colorChangedValue.color,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
          colorSchemeSeed: colorChangedValue.color
      ),
      home: YummyView(
        changedTheme: changeTheme,
        colorSelected: colorChangedValue,
        changeColor: changeColor,
        ),
    );
  }
}