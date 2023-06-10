import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/modules/example/controller/cubit/example_cubit.dart';

/// Example screen.
class Test extends StatelessWidget {
  /// Default constructor.
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExampleCubit, ExampleState>(
      listener: (context, state) {},
      builder: (context, state) {
        return const Text('test');
      },
    );
  }
}
