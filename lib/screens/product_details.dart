import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:model_app/constants/app_assets.dart';
import 'package:model_app/constants/text_style.dart';
import 'package:model_app/models/product_model.dart';
import 'package:model_app/widgets/custom_app_bar.dart';
import 'package:model_app/widgets/top_bar_filter.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.item});
  final ProductModel item;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _showButtomSheet());
  }

  void _showButtomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,  // يمنع النقر على الخلفية من الإغلاق
    enableDrag: false,  
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.15,
          minChildSize: 0.15,
          maxChildSize: 0.8,
          expand: false,

          builder: (BuildContext context, ScrollController scrollController) =>
              Container(
                width: double.infinity,
                height: 200,
                padding: EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Center(
                      child: Container(
                        height: 6,
                        width: 46,
                        decoration: BoxDecoration(
                          color: Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    Gap(13),
                    CustomText.defStyle(
                      txt: widget.item.label,
                      fontWeight: FontWeight.bold,
                      maxLines: 1,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CustomText.defStyle(
                          txt: '${widget.item.price}',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),

                        Icon(Icons.favorite_border_outlined),
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 13),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Color(0xffECECEC),

                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CustomText.defStyle(
                                txt: 'Select colour',
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              Gap(4),
                              SvgPicture.asset(AppAssets.svgSelect),
                            ],
                          ),
                          Container(
                            width: 1,
                            height: 31,
                            color: Color(0xffD9D9D9),
                          ),
                          Row(
                            children: [
                              CustomText.defStyle(
                                txt: 'Select colour',
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),    Gap(4),
                              SvgPicture.asset(AppAssets.svgSelect),
                            ],
                          ),
                        ],
                      ),
                    ),
                Gap(10),
                 Container(
padding: EdgeInsets.symmetric(vertical: 10),
decoration: BoxDecoration(
                  color: Colors.black,
  borderRadius: BorderRadius.circular(5),
),
                  width: double.infinity,
                  child: CustomText.defStyle(txt: 'ADD TO BAG',color: Colors.white),
                 ),
                 
                 
                 
                  ],
                ),
              ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.item.label),
      body: Column(
        children: [
          TopBarFilter(),
          Gap(13),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Image.asset(widget.item.img),
                  ),
                ),

                Positioned(
                  left: 40,
                  right: 40,
                  bottom: 1,
                  child: Image.asset(AppAssets.imageShadow),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
