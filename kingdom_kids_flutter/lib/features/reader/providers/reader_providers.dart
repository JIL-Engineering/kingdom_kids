/*import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kingdom_kids_flutter/features/reader/models/reader_state.dart';

part 'reader_providers.g.dart';



//Provider pour l'index de la page du livre
@riverpod
class ReaderPageIndex extends _$ReaderPageIndex {
  @override
  int build() => 0; // Page initiale

  void setPage(int index) => state = index;
  void nextPage() => state = state + 1;
  void previousPage() {
    if (state > 0) state = state - 1;
  }
}


//Provider pour la langue Fr/En
@riverpod
class ReaderLanguage extends _$ReaderLanguage {
  @override
  String build() => 'FR';

  void toggleLanguage() {
    state = state == 'FR' ? 'EN' : 'FR';
  }
}

//Provider pour l'audio et AudioPlayer
@riverpod
class ReaderAudioState extends _$ReaderAudioState {
  @override
  ({bool isPlaying, bool isAutoPlay}) build() {
    return (isPlaying: false, isAutoPlay: true);
  }

  void togglePlay() {
    state = (isPlaying: !state.isPlaying, isAutoPlay: state.isAutoPlay);
  }

  void toggleAutoPlay() {
    state = (isPlaying: state.isPlaying, isAutoPlay: !state.isAutoPlay);
  }

  void stop() {
    state = (isPlaying: false, isAutoPlay: state.isAutoPlay);
  }
}
*/
