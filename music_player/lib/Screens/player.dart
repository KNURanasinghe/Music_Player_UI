import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/Controller/playerController.dart';
import 'package:music_player/consts/colors.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  const Player({super.key, required this.data});
  final List<SongModel> data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<playerController>();

    return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          child: Column(
            children: [
              Obx(
                () => Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 300,
                    width: 300,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: QueryArtworkWidget(
                      id: data[controller.playIndex.value].id,
                      artworkFit: BoxFit.contain,
                      type: ArtworkType.AUDIO,
                      artworkHeight: double.infinity,
                      artworkWidth: double.infinity,
                      nullArtworkWidget: const Icon(Icons.music_note),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                    color: whiteColor,
                  ),
                  child: Obx(
                    () => Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          data[controller.playIndex.value].displayNameWOExt,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Color(0xff070B11),
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          data[controller.playIndex.value].artist.toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Color(0xff070B11),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(
                          () => Row(
                            children: [
                              Text(
                                controller.position.value,
                                style: const TextStyle(
                                    fontSize: 14, color: bgDarkColor),
                              ),
                              Expanded(
                                child: Slider(
                                  thumbColor: sliderColor,
                                  inactiveColor: bgColor,
                                  activeColor: sliderColor,
                                  min: const Duration(seconds: 0)
                                      .inSeconds
                                      .toDouble(),
                                  max: controller.max.value,
                                  value: controller.value.value,
                                  onChanged: (newValue) {
                                    controller.changeDurationToSeconds(
                                        newValue.toInt());
                                    newValue = newValue;
                                  },
                                ),
                              ),
                              Text(
                                controller.duration.value,
                                style: const TextStyle(
                                    fontSize: 14, color: bgDarkColor),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.playSong(
                                    data[controller.playIndex.value - 1].uri,
                                    controller.playIndex.value - 1);
                              },
                              icon: const Icon(
                                Icons.skip_previous_rounded,
                                size: 40,
                                color: bgDarkColor,
                              ),
                            ),
                            Obx(
                              () => CircleAvatar(
                                backgroundColor: bgDarkColor,
                                radius: 35,
                                child: Transform.scale(
                                  scale: 2.5,
                                  child: IconButton(
                                      onPressed: () {
                                        if (controller.isPlaing.value) {
                                          controller.audioPlayer.pause();
                                          controller.isPlaing(false);
                                        } else {
                                          controller.audioPlayer.play();
                                          controller.isPlaing(true);
                                        }
                                      },
                                      icon: controller.isPlaing.value
                                          ? const Icon(
                                              Icons.pause,
                                              color: whiteColor,
                                            )
                                          : const Icon(
                                              Icons.play_arrow_rounded,
                                              color: whiteColor,
                                            )),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.playSong(
                                      data[controller.playIndex.value + 1].uri,
                                      controller.playIndex.value + 1);
                                },
                                icon: const Icon(
                                  Icons.skip_next_rounded,
                                  size: 40,
                                  color: bgDarkColor,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
