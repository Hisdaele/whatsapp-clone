import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/camera_view_screen.dart';
import 'package:whatsapp/screens/video_view_screen.dart';

List<CameraDescription> cameras = [];

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future _cameraValue;
  bool _isRecording = false;
  bool _flashOn = false;
  int _cameraPosition = 0; // 0 for Back and 1 for Front

  @override
  void initState() {
    super.initState();
    _cameraController =
        CameraController(cameras[_cameraPosition], ResolutionPreset.high);
    _cameraValue = _cameraController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: _cameraValue,
              builder: (_, snap) {
                if (snap.connectionState == ConnectionState.done) {
                  return SizedBox.expand(
                      child: CameraPreview(_cameraController));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (_flashOn) {
                            _cameraController.setFlashMode(FlashMode.off);
                          } else {
                            _cameraController.setFlashMode(FlashMode.torch);
                          }
                          setState(() {
                            _flashOn = !_flashOn;
                          });
                        },
                        icon: Icon(
                          _flashOn ? Icons.flash_on : Icons.flash_off,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      GestureDetector(
                        onLongPress: _startRecordingVideo,
                        onLongPressUp: _stopRecordingVideo,
                        onTap: () {
                          if (!_isRecording) _takePhoto(context);
                        },
                        child: _isRecording
                            ? const Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 80,
                              )
                            : const Icon(
                                Icons.panorama_fisheye,
                                color: Colors.white,
                                size: 70,
                              ),
                      ),
                      IconButton(
                        onPressed: () {
                          _cameraPosition = (_cameraPosition + 1) % 2;
                          _cameraController =
                              CameraController(cameras[_cameraPosition], ResolutionPreset.high);
                          _cameraValue = _cameraController.initialize();
                          setState(() {

                          });
                        },
                        icon: const Icon(
                          Icons.flip_camera_ios,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Text(
                    'Hold for video, tap for photo',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _stopRecordingVideo() async{
    final file = await _cameraController.stopVideoRecording();
    setState(() {
      _isRecording = false;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => VideoViewScreen(imagePath: file.path)));
  }

  void _startRecordingVideo() {
    _cameraController.startVideoRecording();
    setState(() {
      _isRecording = true;
    });
  }

  void _takePhoto(BuildContext context) async {
    final file = await _cameraController.takePicture();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraViewScreen(imagePath: file.path)));
  }
}
