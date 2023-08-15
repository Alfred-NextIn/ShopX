import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shop_x/controllers/productcontroller.dart';
import 'package:shop_x/screens/product_tile.dart';

import '../models/product.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 30,
          left: 15,
          right: 15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.chevron_left)),
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  'ShopX',
                  style: TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900),
                )),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.view_list_rounded)),
                IconButton(onPressed: () {}, icon: Icon(Icons.grid_view))
              ],
            ),
            Expanded(
              child: Obx(() {
                if(ProductController.isLoading.value)
                  {
                     return Center(child: CircularProgressIndicator());
                  }else{
                  return StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount:
                      ProductController.productList.length,
                      //itemCount: 10,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemBuilder: (context, index) {
                        return ProductTile(
                            product: ProductController.productList[index]);
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1));
                }

              }
            ))
          ],
        ),
      ),
    );
  }
}
