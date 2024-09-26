import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'toggle_state.dart';

class ToggleCubit extends Cubit<bool> {
  ToggleCubit() : super(false);

  void toggleUnit() => emit(!state);
}
