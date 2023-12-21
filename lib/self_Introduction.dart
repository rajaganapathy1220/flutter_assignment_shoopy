import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SelfIntroduction extends StatefulWidget {
  const SelfIntroduction({super.key});

  @override
  State<SelfIntroduction> createState() => _SelfIntroductionState();
}

var text =
    '\nHi, I\'m Raja Ganapathy from Neyveli. I completed my Bachelor\'s degree in Chemical Engineering at Agni College of Technology in 2020 and did my schooling in Neyveli.\n\nAfter college, I worked at a company called Tagros. However, I eventually decided to leave and pursued preparation for IREL. Despite my efforts, I couldn\'t clear it.\n\nWith the support of my brother, I transitioned into the IT field.\n\nInitially, I started learning testing for web and mobile applications using tools like Selenium and Appium. This experience provided me with a comprehensive understanding of Software Development Life Cycle (SDLC) and Software Testing Life Cycle (STLC), including knowledge in API testing.\n\nWhile searching for testing-related job opportunities, I realized that the scope for freshers in testing was less.\n\nSo, I decided to explore on development side and began learning to create applications using Flutter.\n\nMy short-term goal is to acquire more skills in this field, and my long-term goal is to master those skills.';

class _SelfIntroductionState extends State<SelfIntroduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          'Self Introduction',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
            onLongPress: () {
              Share.share(text);
            },
          ),
        ),
      ),
    );
  }
}
