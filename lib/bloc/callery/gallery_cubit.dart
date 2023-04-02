import 'package:bloc/bloc.dart';
import 'package:midjourney/bloc/callery/gallery_state.dart';



class GalleryCubit extends Cubit<GalleryState> {
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
}
