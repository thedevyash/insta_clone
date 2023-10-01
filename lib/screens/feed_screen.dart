import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insta_clone/utils/colors.dart';
import 'package:insta_clone/widgets/postCard.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Text(
          "Instagram",
          style: GoogleFonts.lobster(fontSize: 30),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.message_rounded))
        ],
      ),
      body: PostCard(),
    );
  }
}
