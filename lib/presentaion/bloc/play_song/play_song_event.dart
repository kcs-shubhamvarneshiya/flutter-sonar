import 'package:freezed_annotation/freezed_annotation.dart';

part 'play_song_event.freezed.dart';

@freezed
class PlaySongEvent with _$PlaySongEvent {
  const factory PlaySongEvent.playNetworkSongEvent(String videoUrl) =
      PlayNetworkSongEvent;

  const factory PlaySongEvent.pauseNetworkSongEvent() = PauseNetworkSongEvent;
}
