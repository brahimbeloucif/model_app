import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:model_app/constants/app_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
      this.prefixIcon,
      this.suffixIcon,
     this.elevation,
     this.color,
     this.height,
     this.onTap,

  });
  final String title;
  final String? prefixIcon;
  final String? suffixIcon;
  final double ?elevation ;
  final double ? height ;
  final Color ?color;
  final Function()? onTap;
  @override
  Size get preferredSize => Size.fromHeight(height??80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: color??Colors.white,
      elevation: elevation,
      toolbarHeight: preferredSize.height,
      leading: SizedBox.shrink(),
      leadingWidth: 0,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(prefixIcon ?? AppAssets.svgArrowLeft, width: 24)),
          Text(
            title,
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SvgPicture.asset(suffixIcon ?? AppAssets.svgCart, width: 20),
        ],
      ),
    );
  }
}
