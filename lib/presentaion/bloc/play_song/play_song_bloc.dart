import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

import 'package:akdmvisitorsapp/dependencies.dart';
import 'play_song_event.dart';
import 'play_song_state.dart';

@injectable
class AudioPlayerBloc extends Bloc<PlaySongEvent, PlaySongState> {
  AudioPlayer networkAudioPlayer;

  AudioPlayerBloc() : networkAudioPlayer = getIt<AudioPlayer>(),super(const PlaySongState.playerInitialState()) {
    on<PlaySongEvent>(playAudio);
  }

  playAudio(PlaySongEvent event, emit) async {
    emit(const PlaySongState.playerInitialState());
    try {
      if (event is PlayNetworkSongEvent) {
        await networkAudioPlayer.setUrl(event.videoUrl);
        emit(PlaySongState.playNetworkSongState(
            networkAudioPlayer.play() as AudioPlayer, event.videoUrl));
      }
      if (event is PauseNetworkSongEvent) {
        emit(PlaySongState.pauseNetworkSongState(
            networkAudioPlayer.pause() as AudioPlayer));
      }
    } catch (e) {
      emit(PlaySongState.errorNetworkSongState(e.toString()));
    }
  }
}
