import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'example_state.dart';

/// Example cubit.
class ExampleCubit extends Cubit<ExampleState> {
  /// Default constructor.
  ExampleCubit() : super(ExampleInitial());

  /// Get cubit instance.
  static ExampleCubit get(BuildContext context) => BlocProvider.of(context);
}
