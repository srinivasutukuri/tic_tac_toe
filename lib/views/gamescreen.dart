import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tabbar/contents/colors.dart';

import 'package:tabbar/provider/gameprovider.dart';

class Gamescreen extends StatefulWidget {
  const Gamescreen({super.key});

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((e) {
      context.read<GameProvider>().clear();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<GameProvider>(builder: (context, provider, _) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Column(
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.ffdadaColor,
                        border: Border.all(
                          color: AppColors.lightGrey,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Player O",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBrown,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            provider.oscore.toString(),
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.crimson),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.lightYellow,
                        border: Border.all(
                          color: AppColors.lightGrey,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Player X",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.darkBrown,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            provider.xscore.toString(),
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.gold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(color: AppColors.lightGrey),
                  child: GridView.builder(
                    itemCount: 9,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 120,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        provider.onPlay(index, context);
                      },
                      child: Container(
                        decoration: const BoxDecoration(color: AppColors.white),
                        child: provider.tapIndex[index]
                            ? Image.asset(
                                provider.activeImage[index],
                                fit: BoxFit.fill,
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
