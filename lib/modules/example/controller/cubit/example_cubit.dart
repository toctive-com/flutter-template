
import 'package:flutter_bloc/flutter_bloc.dart';

part 'example_state.dart';

class ExampleCubit extends Cubit<ExampleState> {
  ExampleCubit() : super(ExampleInitial());
}
