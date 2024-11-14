import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/cart_item.dart';
import '../../data/models/cart_list_model.dart';
import '../../data/models/network_responce.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class CartListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<CartItemModel> _cartList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<CartItemModel> get cartList => _cartList;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getWishList,
    );
    if (response.isSuccess) {
      _cartList = CartListModel
          .fromJson(response.responseData)
          .cartList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  double get totalPrice {
    double total = 0;
    for (CartItemModel cartItem in _cartList) {
      total += (cartItem.qty!) *
          (double.tryParse(cartItem.product?.price ?? '0') ?? 0);
    }

    return total;
  }

  void changeProductQuantity(int cartId, int quantity) {
    _cartList
        .firstWhere((c) => c.id == cartId)
        .qty = quantity;
    update();
  }

  void _deleteCartItem(int cartId) {
    _cartList.removeWhere((c) => c.id == cartId);
  }

  Future<bool> deleteCartItem(int cartId) async {
    // TODO: call api to remove the cart item
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getWishList, // TODO: Change url
    );
    if (response.isSuccess) {
      _deleteCartItem(cartId);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }


}
