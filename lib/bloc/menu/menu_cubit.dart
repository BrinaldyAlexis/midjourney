import 'package:bloc/bloc.dart';


part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  int currentScreen = 0;
  MenuCubit() : super(MenuInitial());

  void changeScreen(int index) {
    currentScreen = index;
    emit(MenuInitial());
  }
    
}
