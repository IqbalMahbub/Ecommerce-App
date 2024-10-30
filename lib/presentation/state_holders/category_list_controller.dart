import 'package:get/get.dart';
import '../../data/models/category.dart';
import '../../data/models/category_list_model.dart';
import '../../data/models/network_responce.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;
  String _errorMessage = '';
  List<Category> _categoryList = [];

  bool get inProgress => _inProgress;

  List<Category> get categoryList => _categoryList;

  String get errorMessage => _errorMessage;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.categoryList);
    if (response.isSuccess) {
      _categoryList =
          CategoryListModel.fromJson(response.responseData).categoryList ?? [];
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
