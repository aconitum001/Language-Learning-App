import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class ColorsPage extends StatelessWidget {
  final player = AudioPlayer();

  Future<void> playSound(String color) async {
    String audioPath = "sounds/colors/$color.wav";
    await player.play(AssetSource(audioPath));
  }

  String capitalize(String s) {
    return s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
  }

  Map<String, String> names = {
    'black': 'Burakku',
    'brown': 'Chairo',
    'dusty_yellow': 'Hokori ppoi kiiro',
    'gray': 'gure',
    'green': 'Midori',
    'red': 'Aka',
    'yellow': 'Kiiro',
    'white': 'Shiroi',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Colors",
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
                    "assets/images/colors/color_${name.key}.png",
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 100,
                    color: Colors.purple,
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
                          capitalize(name.key).replaceAll("_", ' '),
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  color: Colors.purple,
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
