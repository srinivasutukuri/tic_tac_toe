import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabbar/contents/colors.dart';
import 'package:tabbar/contents/images.dart';
import 'package:tabbar/provider/gameprovider.dart';
import 'package:tabbar/views/gamescreen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightYellow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Consumer<GameProvider>(builder: (context, provider, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        color: AppColors.gold),
                    child: const Text(
                      "Tic Tac Toe",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                  ),
                ),
                Expanded(flex: 5, child: Image(image: AssetImage(tic))),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    children: [
                      const Text(
                        "Who is playing first?",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: AppColors.darkBrown),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                provider.xtap();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Gamescreen(),
                                    ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(555),
                                  color: AppColors.white,
                                  border: Border.all(color: AppColors.lightGrey),
                                ),
                                child: Image(
                                  image: AssetImage(x),
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                provider.otap();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Gamescreen(),
                                    ));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(555),
                                  color: AppColors.white,
                                  border: Border.all(color: AppColors.lightGrey),
                                ),
                                child: Image(
                                  image: AssetImage(o),
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
