import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/modules/example/controller/cubit/example_cubit.dart';

void main() {
  runApp(const MainApp());
}

/// Main app widget.
class MainApp extends StatelessWidget {
  /// Default constructor.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // add bloc providers
        BlocProvider(
          create: (context) => ExampleCubit(),
        ),
      ],
      child: ScreenUtilInit(
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
      ),
    );
  }
}
