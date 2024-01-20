// ignore_for_file: prefer_const_constructors
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Phrases extends StatelessWidget {
  List<ligne> phrases = [
    ligne(
      ch1: "Kodoku suru koto o wasirenaide kudasai",
      ch2: "Dont forget to subscribe",
    ),
    ligne(
      ch1: "Watashi wa puroguramingu ga daisukidesu",
      ch2: "I love programming",
    ),
    ligne(
      ch1: "puroguramingu wa kantandesu",
      ch2: "Programming is easy",
    ),
    ligne(
      ch1: "Doko ni iku no",
      ch2: "where are you going",
    ),
    ligne(
      ch1: "Namae wa nandesu ka",
      ch2: "what is your name",
    ),
    ligne(
      ch1: "Watashi wa anime ga daisukidesu",
      ch2: "I love anime",
    ),
    ligne(
      ch1: "Go Kibun wa ikagadesu ka",
      ch2: "How are you feeling",
    ),
    ligne(
      ch1: "Kimasu Ka",
      ch2: "are you coming",
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4FADC8),
      appBar: AppBar(
        title: const Text(
          "Phrases",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff442F26),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the desired color here
        ),
      ),
      body: ListView.builder(
        itemCount: phrases.length,
        itemBuilder: (context, index) => phrases[index],
      ),
    );
  }
}

class ligne extends StatelessWidget {
  final player = AudioPlayer();

  Future<void> playSound(String phrase) async {
    String path = phrase.toLowerCase().replaceAll(" ", "_");
    String audioPath = "sounds/phrases/$path.wav";
    await player.play(AssetSource(audioPath));
  }

  ligne({
    this.ch1,
    this.ch2,
  });
  String? ch1;
  String? ch2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ch1!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                Text(
                  ch2!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            playSound(ch2!);
          },
          icon: const Icon(
            Icons.play_arrow,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
