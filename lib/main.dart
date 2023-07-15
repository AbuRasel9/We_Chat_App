import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:we_chat/Screens/splashScreen.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeApp();

  //start full screen in splash screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //for setting orientation to portrait only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]).then((value) => {
    runApp(const MyApp())
  });
}
//global object for accessing device screen size
late Size mq;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'We Chat',

      theme: ThemeData(
        //appBar style
        appBarTheme:  AppBarTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          elevation: 2,
          //Icon style
          iconTheme: const IconThemeData(color: Colors.black,weight: 500),

          backgroundColor: Colors.white54,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Colors.black,

          )

        ),


      ),
      home: const splashScreen()

    );
  }
}
_initializeApp() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

