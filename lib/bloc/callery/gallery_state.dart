
import 'package:equatable/equatable.dart';

class GalleryState extends Equatable {
  
  const GalleryState({
    this.favorites = const {},
  });

  final Map<String, int> favorites;

  GalleryState copyWith({
    int? currentScreen,
    Map<String, int>? favorites,
  }) {
    return GalleryState(
      favorites: favorites ?? this.favorites,
    );
  }
  
  @override
  List<Object?> get props => [
    favorites];
  
}

