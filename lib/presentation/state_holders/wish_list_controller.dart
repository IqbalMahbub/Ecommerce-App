

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/network_responce.dart';
import '../../data/models/wish_list_item.dart';
import '../../data/models/wish_list_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class WishListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<WishListItem> _wishList = [];

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  List<WishListItem> get wishList => _wishList;

  Future<bool> getWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getWishList,
    );
    if (response.isSuccess) {
      _wishList = WishListModel.fromJson(response.responseData).wishList ?? [];
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
