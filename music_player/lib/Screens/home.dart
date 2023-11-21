import 'package:flutter/material.dart';
import 'package:music_player/consts/colors.dart';

import '../consts/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgDarkColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: whiteColor,
                ))
          ],
          leading: const Icon(
            Icons.sort_rounded,
            color: whiteColor,
          ),
          title: Text(
            "Player",
            style: OurStyle(
              family: bold,
              size: 18,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      tileColor: bgColor,
                      title: Text(
                        "Music Name",
                        style: OurStyle(family: bold, size: 15),
                      ),
                      subtitle: Text(
                        "Artist Name",
                        style: OurStyle(family: regular, size: 12),
                      ),
                      leading: const Icon(
                        Icons.music_note,
                        color: whiteColor,
                        size: 32,
                      ),
                      trailing: const Icon(
                        Icons.play_arrow,
                        color: whiteColor,
                        size: 26,
                      ),
                    ));
              }),
        ));
  }
}
