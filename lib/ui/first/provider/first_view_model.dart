import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class FirstViewModel extends ChangeNotifier {
  List<CameraDescription> list = [];
  late CameraController cameraController;
  void startCamera() async {
    list = await  availableCameras();
    cameraController = CameraController(
      list[1],
      ResolutionPreset.max,
      enableAudio: false
    );
    await cameraController.initialize().onError((error, stackTrace) => print(error));
    notifyListeners();
  }
}