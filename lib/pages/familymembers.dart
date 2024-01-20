import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class FamilyMembers extends StatelessWidget {
  final player = AudioPlayer();

  Future<void> playSound(String name) async {
    String audioPath = "sounds/family_members/$name.wav";
    await player.play(AssetSource(audioPath));
  }

  Map<String, String> names = {
    'grand_father': 'Ojison',
    'grand_mother': 'Sobo',
    'father': 'Chichioya',
    'mother': 'Hahaoya',
    'son': 'Musuko',
    'daughter': 'Musume',
    'older_brother': 'Nisan',
    'older_sister': 'Ane',
    'younger_brother': 'Otouto',
    'younger_sister': 'Imoto',
  };

  @override
  Widget build(BuildContext context) {
    String capitalize(String s) {
      return s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Family Members",
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
                  color: const Color(0xffFEF4DC),
                  child: Image.asset(
                    "assets/images/family_members/family_${name.key}.png",
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 100,
                    color: Colors.green,
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
                  color: Colors.green,
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
