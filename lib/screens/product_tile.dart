import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductTile extends StatelessWidget {
  Product product;



  ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: Image.network(
                   product.imageLink,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 300,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(child: Text(product.name, style: TextStyle(fontSize: 12.0),))
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(
                        children: [
                         Container(
                           width:50,
                           height: 20,
                           color: Colors.green,
                           child: Padding(
                             padding: const EdgeInsets.only(left: 8.0, top: 2.0),
                             child: Row(
                               children: [
                                 Text(product.rating.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                                 Icon(Icons.star,size: 15.0, color: Colors.white),
                               ],
                             ),
                           ),
                         )
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(
                        children: [
                          Text("\$"+product.price.toString(), style: TextStyle(fontSize: 20),),
                        ],
                      )
                    ],
                  ),
                ),

              ],
            )
          ],
        )
      ),
    );
  }
}
