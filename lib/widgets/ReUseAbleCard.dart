import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:we_chat/main.dart';
import 'package:we_chat/models/chat_user.dart';
import 'package:we_chat/Screens/splashScreen.dart';

class ReUseAbleCard extends StatefulWidget {
  final ChatUser user;

  const ReUseAbleCard({super.key, required this.user});

  @override
  State<ReUseAbleCard> createState() => _ReUseAbleCardState();
}

class _ReUseAbleCardState extends State<ReUseAbleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      elevation: 1,
      margin: const EdgeInsets.all(2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          //user profile picture
          //ClipRRect use for image border radious
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(mq.height *.3 ),
            
            child: CachedNetworkImage(
              width: mq.height * .055,
              height: mq.height * .055,
              imageUrl: widget.user.image,
              errorWidget: (context, url, error) => const CircleAvatar(
                child: Icon(CupertinoIcons.person),
              ),
            ),
          ),

          //user name
          title: Text(widget.user.name),
          //user last message
          subtitle: Text(
            widget.user.about,
            maxLines: 1,
          ),
          //user last message time
          trailing: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green
            ),
          ),
          // trailing: const Text(
          //   "12.00",
          //   style: TextStyle(color: Colors.black54),
          // ),
        ),
      ),
    );
  }
}
