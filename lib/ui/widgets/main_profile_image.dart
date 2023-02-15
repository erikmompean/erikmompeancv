import 'package:erikmompean/resources/app_images.dart';
import 'package:flutter/material.dart';

class MainProfileImage extends StatelessWidget {
  const MainProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                height: 420,
                width: 300,
                color: const Color(0xFF9e9e9e),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
                height: 500,
                child: Image.asset(
                  AppImages.me,
                )),
          ),
        ],
      ),
    );
  }
}
