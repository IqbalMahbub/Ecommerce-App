import 'package:get/get.dart';

import '../../data/models/network_responce.dart';
import '../../data/models/product.dart';
import '../../data/models/product_list_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';


class SpecialProductListController extends GetxController {
  bool _inProgress = false;

  List<Product> _productList = [];

  String _errorMessage = '';

  bool get inProgress => _inProgress;

  List<Product> get productList => _productList;

  String get errorMessage => _errorMessage;

  Future<bool> getSpecialProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.productListByRemark('Special'));
    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
