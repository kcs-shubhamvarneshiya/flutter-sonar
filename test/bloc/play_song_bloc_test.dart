import 'package:akdmvisitorsapp/presentaion/bloc/play_song/play_song_bloc.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/play_song/play_song_event.dart';
import 'package:akdmvisitorsapp/presentaion/bloc/play_song/play_song_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mockito/mockito.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {
  @override
  Future<void> play() async {
    // Simulate the play behavior for testing.
    return super.noSuchMethod(
      Invocation.method(#play, []),
      returnValue: Future.value(),
    );
  }
}

GetIt sl = GetIt.instance;

Future<void> setupGetIt(MockAudioPlayer mockAudioPlayer) async {
  sl.registerSingleton<AudioPlayer>(mockAudioPlayer);
}

void main() {
  final mockAudioPlayer = MockAudioPlayer();
  setupGetIt(mockAudioPlayer);

  group('AudioPlayerBloc', () {
    late AudioPlayerBloc audioPlayerBloc;

    setUp(() {
      audioPlayerBloc = AudioPlayerBloc();
    });


    blocTest<AudioPlayerBloc, PlaySongState>(
      'emits the expected states when playing a network song',
      build: () => audioPlayerBloc,
      act: (bloc){
        bloc.add(const PlayNetworkSongEvent('https://example.com/song.mp3'));
      },
      expect: () => [
        const PlaySongState.playerInitialState(),
        PlaySongState.playNetworkSongState(mockAudioPlayer, 'https://example.com/song.mp3'),
      ],
    );

    blocTest<AudioPlayerBloc, PlaySongState>(
      'emits the expected states when pausing a network song',
      build: () => audioPlayerBloc,
      act: (bloc) => bloc.add(PauseNetworkSongEvent()),
      expect: () => [
        PlaySongState.pauseNetworkSongState(mockAudioPlayer),
      ],
    );

    blocTest<AudioPlayerBloc, PlaySongState>(
      'emits the expected state when an error occurs',
      build: () => audioPlayerBloc,
      act: (bloc) {
        bloc.add(const PlayNetworkSongEvent('https://example.com/song.mp3'));
      },
      expect: () => [
        const PlaySongState.playerInitialState(),
        const PlaySongState.errorNetworkSongState('Network error'),
      ],
    );


  });
}