import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: const Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
      builder: (context, child) {
        return MaterialApp(
          home: child,
        );
      },
    );
  }
}
