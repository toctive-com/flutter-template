import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(ExampleInitial());

  static ExampleCubit get(BuildContext context) => BlocProvider.of(context);
}
