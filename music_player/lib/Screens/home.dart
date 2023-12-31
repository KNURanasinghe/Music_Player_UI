import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/Controller/playerController.dart';
import 'package:music_player/Screens/player.dart';
import 'package:music_player/consts/colors.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(playerController());

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
          title: const Text(
            "Player",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        body: FutureBuilder<List<SongModel>>(
            future: controller.audioQuery.querySongs(
                ignoreCase: true,
                orderType: OrderType.ASC_OR_SMALLER,
                sortType: null,
                uriType: UriType.EXTERNAL),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.data.isEmpty) {
                return const Center(
                  child: Text(
                    "No Songs Found",
                    style: TextStyle(fontSize: 14, color: whiteColor),
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: const EdgeInsets.only(bottom: 4),
                            child: Obx(
                              () => ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                tileColor: bgColor,
                                title: Text(
                                    snapshot.data![index].displayNameWOExt,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white)),
                                subtitle: Text(
                                  snapshot.data![index].artist,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                leading: QueryArtworkWidget(
                                  id: snapshot.data![index].id,
                                  type: ArtworkType.AUDIO,
                                  nullArtworkWidget: const Icon(
                                    Icons.music_note,
                                    color: whiteColor,
                                    size: 32,
                                  ),
                                ),
                                trailing: controller.playIndex.value == index &&
                                        controller.isPlaing.value
                                    ? const Icon(
                                        Icons.play_arrow,
                                        color: whiteColor,
                                        size: 26,
                                      )
                                    : null,
                                onTap: () {
                                  Get.to(() => Player(
                                        data: snapshot.data!,
                                      ));
                                  controller.playSong(
                                      snapshot.data![index].uri, index);
                                },
                              ),
                            ));
                      }),
                );
              }
            }),
            );
  }
}
