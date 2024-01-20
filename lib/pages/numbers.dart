import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class NumbersPage extends StatelessWidget {
  final player = AudioPlayer();

  Future<void> playSound(String number) async {
    String audioPath = "sounds/numbers/number_${number}_sound.mp3";
    await player.play(AssetSource(audioPath));
  }

  Map names = {
    'one': 'Ichie',
    'two': 'Ni',
    'three': 'San',
    'four': 'Shi',
    'five': 'Go',
    'six': 'Roku',
    'seven': 'nana',
    'eight': 'hachi',
    'nine': 'kyu',
    'ten': 'jyu',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Numbers",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff442F26),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set the desired color here
        ),
      ),
      body: ListView(
        children: [
          for (var name in names.entries)
            Row(
              children: [
                Container(
                  width: 100,
                  height: 101,
                  color: Color(0xffFEF4DC),
                  child: Image.asset(
                    "assets/images/numbers/number_${name.key}.png",
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 100,
                    color: const Color(0xffF09134),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name.value,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          name.key,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  color: const Color(0xffF09134),
                  child: IconButton(
                    onPressed: () {
                      playSound(name.key);
                    },
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
