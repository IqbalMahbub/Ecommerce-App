import 'package:get/get.dart';

import '../../data/models/network_responce.dart';
import '../../data/models/product.dart';
import '../../data/models/product_list_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';


class PopularProductListController extends GetxController {
  bool _popularProductInProgress = false;

  List<Product> _productList = [];

  String _errorMessage = '';

  bool get popularProductInProgress => _popularProductInProgress;

  List<Product> get productList => _productList;

  String get errorMessage => _errorMessage;

  Future<bool> getPopularProductList() async {
    bool isSuccess = false;
    _popularProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.productListByRemark('Popular'));
    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage!;
    }
    _popularProductInProgress = false;
    update();
    return isSuccess;
  }
}
