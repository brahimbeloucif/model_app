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

    _controller = VideoPlayerController.asset('assets/video/video.mp4')
      ..initialize().then((value) {
        setState(() {
          _controller.play();
        });
      });
    // !!  set this to auto loop video play       })..setLooping(true);
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
          Expanded(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          ),

          // ! categories
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(color: Colors.white),

              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    CustomText.defStyle(
                      txt: 'Categories',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(category.length, (index) {
                          final item = category[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c)=>CategoryScreen())),
                              child: Column(
                                children: [
                                  Image.asset(item.img,width: 75,),
                              
                                  Gap(10),
                                  CustomText.defStyle(txt: item.label),
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
  }
}
