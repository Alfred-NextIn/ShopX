import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shop_x/models/product.dart';
import 'package:shop_x/services/remote_services.dart';

class ProductController extends GetxController
{
  static var isLoading = true.obs;
  static var productList = <Product>[].obs;

  @override

  void onInit() {
   fetchProducts();
   super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
     var products = await RemoteServices.fetchProducts();

     try{
       if(products != null)
       {
         productList.value = products;
       }
     }finally{
       isLoading(false);
     }


  }

}