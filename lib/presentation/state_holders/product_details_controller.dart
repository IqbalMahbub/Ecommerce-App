

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/network_responce.dart';
import '../../data/models/product_details_model.dart';
import '../../data/models/product_details_wrapper_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  bool get inProgress => _inProgress;

  ProductDetailsModel get productDetailsModel => _productDetailsModel;

  String get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
        url: Urls.productDetails(productId));
    if (response.isSuccess) {
      if (_errorMessage.isNotEmpty) {
        _errorMessage = '';
      }
      _productDetailsModel =
          ProductDetailsWrapperModel.fromJson(response.responseData)
              .productDetails!
              .first;
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}