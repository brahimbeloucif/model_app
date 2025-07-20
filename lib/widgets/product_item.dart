
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:model_app/constants/app_assets.dart';
import 'package:model_app/constants/text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.label, required this.img, required this.price,required this.onTap,
   });

final String label , img,price;
final Function()? onTap;
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //'Top man black', img: AppAssets.model1 , AppAssets.model1 ),
                        Container(
                          width: 200,
                          height: 255,
                          decoration: BoxDecoration(
                            color: Color(0xffECECEC),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Stack(
                              children: [
       Center(child: Image.asset(img, height: 244)),
       Positioned(
        left: 10,
        right: 10,
        bottom: -114,
         child: Image.asset(AppAssets.imageShadow, height: 244)),
      
                              ],
                            ),
                          ),
                        ),
                        Gap(13),
                        CustomText.defStyle(
                          txt: label,
                          fontWeight: FontWeight.w500,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis
                        ),
                        Gap(6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomText.defStyle(txt: '${price}', fontWeight: FontWeight.w600),
                         
                            Icon(Icons.favorite_border_outlined),
                          ],
                        ),
                      ],
                    ),
    );
  }
}
