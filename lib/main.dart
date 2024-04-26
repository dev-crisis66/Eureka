import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}

class Controller extends GetxController{
  var count = 0.obs;
  increment() => count++;
}

class Home extends StatelessWidget {

  @override
  Widget build(context) {

    final Controller c = Get.put(Controller());

    return Scaffold(

        appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),

        body: const Center(child: CircularProgressIndicator(),),
        floatingActionButton:
        FloatingActionButton(onPressed: c.increment, child: const Icon(Icons.add)));
  }
}