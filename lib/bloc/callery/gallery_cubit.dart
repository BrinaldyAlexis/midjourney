import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:midjourney/bloc/callery/gallery_state.dart';

class GalleryCubit extends HydratedCubit<GalleryState> {
  GalleryCubit() : super(const GalleryState());


  void toggleFavorite(String url) {
    final favoriteImages = Map<String, int>.from(state.favorites);
    if(favoriteImages.containsKey(url)) {
      favoriteImages.remove(url);
    } else {
      favoriteImages[url] = DateTime.now().millisecondsSinceEpoch;
    }

    emit(state.copyWith(favorites: favoriteImages));
  }

  bool isFavorite(String url) {
    return state.favorites.containsKey(url);
  }
  
  @override
  GalleryState? fromJson(Map<String, dynamic> json) {
    return GalleryState(
      favorites: Map<String, int>.from(json['favorites'] as Map)
    );
  }
  
  @override
  Map<String, dynamic>? toJson(GalleryState state) {
    return {
      'favorites': state.favorites
    };
  }
}
