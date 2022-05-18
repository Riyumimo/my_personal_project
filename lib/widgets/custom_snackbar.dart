import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';
class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    required this.title,
    required this.description,
    required this.colorBase,
    required this.colorImage,
    required this.colorIcon,
    Key? key,
  }) : super(key: key);
  final String title;
  final String description;
  final Color colorBase;
  final Color colorImage;
  final Color colorIcon;


  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        padding: EdgeInsets.all(defaultPadding),
        height: 90,
        decoration: BoxDecoration(
          color: colorBase,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 48,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18, color: Colors.white),
                ),
                Text(description,
                    style: TextStyle(
                        fontSize: 18, color: Colors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis)
              ],
            ))
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20)),
          child: SvgPicture.asset(
            'assets/icons/bubbles.svg',
            height: 48,
            width: 48,
            color: colorIcon,
          ),
        ),
      ),
      Positioned(
        top: -20,
        left: 0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/fail.svg',
              height: 48,
              color: Color(0xFF801336),
            ),
            Positioned(
              top: 15,
              child: SvgPicture.asset(
                'assets/icons/close.svg',
                height: 16,
              ),
            )
          ],
        ),
      )
    ]);
  }
}