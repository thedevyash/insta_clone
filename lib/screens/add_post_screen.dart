import 'package:flutter/material.dart';
import 'package:insta_clone/utils/colors.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
          ),
          backgroundColor: mobileBackgroundColor,
          title: Text("Post To"),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Post",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(""),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Write a Caption...",
                        border: InputBorder.none),
                    maxLines: 8,
                  ),
                ),
                SizedBox(
                  height: 45,
                  child: AspectRatio(
                      aspectRatio: 487 / 451,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://imgs.search.brave.com/YWpf30WOMzcel9M9VUKq82bO8ykQTyrdITRH-TncMZM/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vaS5yZWRk/Lml0L3hlZnk5aGd5/dG5hNTEucG5n"),
                              fit: BoxFit.fill,
                              alignment: FractionalOffset.topCenter),
                        ),
                      )),
                )
              ],
            )
          ],
        ));
  }
}
