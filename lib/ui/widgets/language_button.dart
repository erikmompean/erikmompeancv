import 'package:erikmompean/ui/widgets/app_device_builder.dart';
import 'package:flutter/material.dart';

class LanguageButton extends StatelessWidget {
  final String imagePath;
  final bool? isSelected;
  final void Function()? onTap;
  const LanguageButton({
    super.key,
    required this.imagePath,
    this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppDeviceBuilder(builder: (buildContext, devices, deviceSize) {
      double size;

      switch (devices) {
        case Devices.mobile:
          size = 80;
          break;
        case Devices.tablet:
          size = 100;
          break;
        case Devices.desktop:
          size = 120;
          break;
      }

      return GestureDetector(
        onTap: onTap,
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              border: isSelected ?? false
                  ? null
                  : Border.all(color: Colors.grey.shade300, width: 1.2),
              borderRadius: BorderRadius.circular(20),
              gradient: isSelected ?? false
                  ? LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[
                        Colors.blue.shade200,
                        Colors.pink.shade200
                      ],
                    )
                  : null),
          child: Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              )),
        ),
      );
    });
  }
}
