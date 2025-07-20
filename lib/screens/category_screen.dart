 import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:model_app/constants/app_assets.dart';
import 'package:model_app/models/product_model.dart';
import 'package:model_app/screens/product_details.dart';
import 'package:model_app/widgets/custom_app_bar.dart';
import 'package:model_app/widgets/product_item.dart';
import 'package:model_app/widgets/top_bar_filter.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final List<ProductModel> products = [
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
                  childAspectRatio: 1 / 1.96,
                ),
                itemBuilder: (context, index) {
                  final item = products[index];
                  return ProductItem(
                    label: item.label,
                    img: item.img,
                    price: item.price,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (c) => ProductDetails(item: item,)),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
