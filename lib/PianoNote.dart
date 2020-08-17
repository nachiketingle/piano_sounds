import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:piano_sounds/AudioService.dart';

class PianoNote extends StatefulWidget {
  PianoNote({@required this.note});
  _PianoNoteState createState() => _PianoNoteState();
  final String note;
}

class _PianoNoteState extends State<PianoNote> {
  static AudioCache player = AudioService.player;
  AudioPlayer _audioPlayer;
  bool isPressed = false;

  void playAudio(bool _onTap) {
    player.play(widget.note + '.mp3').then((value) {

      if(_audioPlayer != null)
        stopAudio();

      _audioPlayer = value;
      _audioPlayer.seek(Duration(milliseconds: 500));
      if(_onTap) {
        Future.delayed(Duration(milliseconds: 500), () {
          stopAudio();
        });
      }
      setState(() {
        isPressed = true;
      });
    });
  }

  void stopAudio() {
    _audioPlayer.stop();
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => playAudio(true),
      onLongPress: () => playAudio(false),
      onTapUp: (_) => playAudio,
      onLongPressUp: () => stopAudio(),
      child: Container(
        width: MediaQuery.of(context).size.width / (AudioService.allNotes.length + 1),
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: isPressed ? Colors.grey : Colors.white,
          border: Border.all(
            color: Colors.black
          ),
        ),
        child: Center(child: Text(widget.note)),
      ),
    );
  }
}