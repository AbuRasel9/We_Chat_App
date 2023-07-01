import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Home button add in
        leading:  const Icon(Icons.home,),
        title: const Text("We Chat"),
        actions: [
          IconButton(
              disabledColor: Colors.greenAccent,
              onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      //floating acction button add for add user
      floatingActionButton: Padding(
        padding:const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          child: const Icon((Icons.add_comment_rounded)),
          onPressed: (){},
        ),
      ),
    );
  }
}
