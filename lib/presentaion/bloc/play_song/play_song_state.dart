import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'play_song_state.freezed.dart';

@freezed
class PlaySongState with _$PlaySongState {
  const factory PlaySongState.playerInitialState() = _PlayerInitialState;

  const factory PlaySongState.playNetworkSongState(
      AudioPlayer assetsPlayer, String videoUrl) = _PlayNetworkSongState;

  const factory PlaySongState.pauseNetworkSongState(AudioPlayer assetsPlayer) =
      _PauseNetworkSongState;

  const factory PlaySongState.errorNetworkSongState(String error) =
      _ErrorNetworkSongState;
}
