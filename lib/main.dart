import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_wallet_app/styles.dart';
import './screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eWallet',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline5: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.w600,
          ),
          headline4: TextStyle(color: AppColor.primaryColor, letterSpacing: .5),
          headline6: TextStyle(color: AppColor.primaryColor)
        ),
      ),
      home: HomeScreen(),
    );
  }
}
