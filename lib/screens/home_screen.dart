import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_app/constants/text_style.dart';
import 'package:model_app/models/category_model.dart';
import 'package:model_app/screens/category_screen.dart';
import 'package:model_app/widgets/custom_app_bar.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;

  List<CategoryModel> category = [
    CategoryModel(img: 'assets/images/category/Women.png', label: 'Women'),
    CategoryModel(img: 'assets/images/category/Men.png', label: 'Men'),
    CategoryModel(img: 'assets/images/category/Kids.png', label: 'Kids'),
    CategoryModel(img: 'assets/images/category/Deals.png', label: 'Deals'),
    CategoryModel(img: 'assets/images/category/Health.png', label: 'Health'),
  ];
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset('assets/video/output_compressed.mp4')
      ..initialize().then((value) {
        setState(() {
          _controller.play();
        });
      })
      ..setLooping(true);
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: CustomAppBar(
      title: 'Runway',
     
      prefixIcon: 'assets/svgs/menu.svg',
      suffixIcon: 'assets/svgs/notification.svg',
    ),
    body: Stack(
      children: [
        // Video background - keeps original aspect ratio
        Transform.translate(
          offset: Offset(0, -70), // Move video up by 20 pixels
          child: Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Container(color: Colors.black),
          ),
        ),
        
        // Categories overlay at the bottom
        Positioned(
          left: 0,
          right: 0,
          bottom: 90, // Move categories up by 20 pixels from bottom
          child: SafeArea(
            top: false,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white, // Semi-transparent
 
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText.defStyle(
                    txt: 'Categories',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                  Gap(8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(category.length, (index) {
                        final item = category[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (c) => CategoryScreen()),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(30),
                                    child: Image.asset(
                                      item.img,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Gap(6),
                                CustomText.defStyle(
                                  txt: item.label,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}}