import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/provider/dark_theme.dart';
import 'package:shop_flutter/screens/bottom_bar.dart';

import 'constants/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider _darkThemeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    _darkThemeProvider.darkTheme =
        await _darkThemeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    this.getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => _darkThemeProvider),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, themeData, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: Styles.themeData(themeData.isDarkTheme, context),
            // home: MyHomePage(title: 'Flutter Demo Home Page'),(
            home: BottomBarScreen(),
          );
        },
      ),
    );
  }
}
