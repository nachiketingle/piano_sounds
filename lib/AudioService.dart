import 'package:audioplayers/audio_cache.dart';

class AudioService {
  static AudioCache player = AudioCache(prefix: 'sounds/')
    ..loadAll(mp3Files())
    ..disableLog();

  static List<String> allNotes = ['middle_C', 'D', 'E', 'F', 'G', 'A', 'B'];

  static List<String> mp3Files() {
    List<String> mp3Files = List.from(allNotes);
    for(int i = 0; i < mp3Files.length; i++) {
      mp3Files[i] = mp3Files[i] + '.mp3';
    }
    return mp3Files;
  }
}