import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class playerController extends GetxController {
  final audioQuery = new OnAudioQuery();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    checkPermission();
  }

  checkPermission() async {
    var perm = await Permission.storage.request();

    if (perm.isGranted) {
      return audioQuery.querySongs(
          );
    } else {
      checkPermission();
    }
  }
}
