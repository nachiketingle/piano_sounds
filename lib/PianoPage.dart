import 'package:flutter/material.dart';
import 'package:piano_sounds/AudioService.dart';
import 'PianoNote.dart';

class PianoPage extends StatefulWidget {
  _PianoPageState createState() => _PianoPageState();
}

class _PianoPageState extends State<PianoPage> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> noteList() {
    List<Widget> notes = List();
    for(String note in AudioService.allNotes) {
      notes.add(PianoNote(
        note: note,
      ));
    }
    return notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Piano Page"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() { });
            },
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: noteList(),
          ),
        ),
      ),
    );
  }
}