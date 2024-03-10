// ignore_for_file: sort_child_properties_last

import 'package:camera/camera.dart';
import 'package:checkdavomat/ui/first/provider/first_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  


  @override
  void initState() {
    context.read<FirstViewModel>().startCamera();
    super.initState();
  }

  @override
  void deactivate() {
    context.read<FirstViewModel>().cameraController.dispose();
    super.deactivate();
  }

  

  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        context.read<FirstViewModel>().cameraController.dispose();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("CheckDavomat Timepad"),
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.menu),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: height*.5,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green
                ),
                child: context.watch<FirstViewModel>().cameraController.value.isInitialized?CameraPreview(context.watch<FirstViewModel>().cameraController):const SizedBox(),
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ZoomTapAnimation(
                            onTap: () {},
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(width: 2,color: Colors.green)
                              ),
                              child: const Center(child: Text("Login"),),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Expanded(
                          child: ZoomTapAnimation(
                            onTap: () {},
                            child: Container(
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(width: 2,color: Colors.green)
                              ),
                              child: const Center(child: Text("Password"),),
                            ),
                          ),
                        )
                      ],
                    ),
                    SwipeButton.expand(
                      thumb: const Icon(
                        Icons.double_arrow_rounded,
                        color: Colors.white,
                      ),
                      child: const Text(
                        "Swipe to ...",
                      ),
                      activeThumbColor: Colors.green,
                      activeTrackColor: Colors.grey.shade300,
                      onSwipe: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Watafak bro"),
                            duration: Duration(milliseconds: 800),
                            backgroundColor: Colors.blue,
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}