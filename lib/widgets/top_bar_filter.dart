
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:model_app/constants/app_assets.dart';
import 'package:model_app/constants/text_style.dart';

class TopBarFilter extends StatelessWidget {
  const TopBarFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Color(0xffECECEC), width: 2),
        ),
      ),
    
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          children: [
            CustomText.defStyle(txt: 'Sort by'),
            const Gap(23),
            SvgPicture.asset(AppAssets.svgSelect),
            Spacer(),
            SvgPicture.asset(AppAssets.svgFilter),
            const Gap(6),
            CustomText.defStyle(txt: 'Filter'),
            const Gap(20),
            SvgPicture.asset(AppAssets.svgGrid),
            const Gap(20),
            SvgPicture.asset(AppAssets.svgGroups),
          ],
        ),
      ),
    );
  }
}
