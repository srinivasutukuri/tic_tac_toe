import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabbar/contents/colors.dart';
import 'package:tabbar/provider/gameprovider.dart';

class BottomSheetwidget extends StatelessWidget {
  const BottomSheetwidget({
    super.key,
    required this.url,
    required this.title,
    required this.contant,
    required this.buttonname,
  });
  final String url, title, contant, buttonname;

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, provider, _) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Image(
            image: AssetImage(url),
            height: 200,
            width: 200,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: AppColors.darkBrown,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              contant,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              provider.reset();
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(555),
                color: AppColors.cobaltBlue,
              ),
              child: Text(
                buttonname,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    });
  }
}
