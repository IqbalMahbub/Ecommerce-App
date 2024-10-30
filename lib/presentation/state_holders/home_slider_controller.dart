import 'dart:async';

import 'package:ecommerceapp/data/models/slider_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../data/models/network_responce.dart';
import '../../data/models/slider_list_model.dart';
import '../../data/network_caller/network_caller.dart';
import '../../data/utility/urls.dart';

class HomeSliderController extends GetxController {
  bool _inProgress = false;
  String _errorMassage = " ";
  List<SliderData> _siderList = [];

  bool get inProgress => _inProgress;

  List<SliderData> get siderList => _siderList;

  String get errorMassage => _errorMassage;

  Future<bool> getSliders() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(url: Urls.homeSlider);
    if (response.isSuccess) {
      _siderList =
          SliderListModel.fromJson(response.responseData).sliderList ?? [];
    } else {
      _errorMassage = response.errorMassage!;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
