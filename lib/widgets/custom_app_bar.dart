import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.prefixIcon,
    required this.suffixIcon,
     this.elevation,
     this.color,
     this.height,

  });
  final String title, prefixIcon, suffixIcon;
  final double ?elevation ;
  final double ? height ;
  final Color ?color;
  @override
  Size get preferredSize => Size.fromHeight(height??80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: color,
      elevation: elevation,
      toolbarHeight: preferredSize.height,
      leading: SizedBox.shrink(),
      leadingWidth: 0,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(prefixIcon, width: 24),
          Text(
            title,
            style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SvgPicture.asset(suffixIcon, width: 20),
        ],
      ),
    );
  }
}
