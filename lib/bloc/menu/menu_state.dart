part of 'menu_cubit.dart';

abstract class MenuState {}

class MenuInitial extends MenuState {
  int currentScreen = 0;
  MenuInitial({currentScreen}); 
}

