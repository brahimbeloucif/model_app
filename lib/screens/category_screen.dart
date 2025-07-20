import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:model_app/constants/app_assets.dart';
import 'package:model_app/constants/text_style.dart';
import 'package:model_app/models/product_model.dart';
import 'package:model_app/widgets/custom_app_bar.dart';
import 'package:model_app/widgets/top_bar_filter.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  List<ProductModel> products = [
    ProductModel(label: 'Top man black', img: AppAssets.model1, price: '£20'),
    ProductModel(
      label: 'Deep gray essential regular',
      img: AppAssets.model2,
      price: '£25',
    ),
    ProductModel(
      label: 'Top man black with Trous',
      img: AppAssets.model3,
      price: '£30',
    ),
    ProductModel(
      label: 'Gray coat and white T-shirt',
      img: AppAssets.model4,
      price: '£35',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        elevation: 0,
        color: Colors.white,
        title: 'Men',
        height: 58,
        prefixIcon: AppAssets.svgArrowLeft,
        suffixIcon: AppAssets.svgCart,
      ),

      body: Column(
        children: [
          TopBarFilter(),

          // product

 Gap(6),

          Expanded(
            child: Padding(

              padding: const EdgeInsets.symmetric(horizontal: 19.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  childAspectRatio:1/1.96 ,
                  ), 
                itemBuilder: (context , index){
                  final item =products[index];
                  return 
                         Column(

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
                          Center(child: Image.asset(item.img, height: 244)),
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
                    txt: item.label,
                    fontWeight: FontWeight.w500,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis
                  ),
                  Gap(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CustomText.defStyle(txt: '£${item.price}', fontWeight: FontWeight.w600),
                   
                      Icon(Icons.favorite_border_outlined),
                    ],
                  ),
                ],
              );
                  
              
              
              
              
              //![[[[[[[[[[[[[[[[[[[[]]]]]]]]]]]]]]]]]]]]
               
                 
                }),
            ),
          ),],
      ),
    );
  }
}
