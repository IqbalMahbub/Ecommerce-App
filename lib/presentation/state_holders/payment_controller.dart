
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/models/network_responce.dart';
import '../../data/models/payment_method_list_model.dart';
import '../../data/models/product_details_model.dart';
import '../../data/models/product_details_wrapper_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class CreateInvoiceController extends GetxController {
  bool _inProgress = true;

  PaymentMethodListModel _paymentMethodListModel = PaymentMethodListModel();

  String _errorMessage = '';

  bool get inProgress => _inProgress;

  PaymentMethodListModel get paymentMethodListModel => _paymentMethodListModel;

  String get errorMessage => _errorMessage;

  Future<bool> createInvoice() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller.getRequest( url: Urls.createInvoice);
    if (response.isSuccess) {
      _paymentMethodListModel =
          PaymentMethodListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
