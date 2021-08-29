import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter/provider/dark_theme.dart';
import 'package:shop_flutter/screens/bottom_bar.dart';

import 'constants/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
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
