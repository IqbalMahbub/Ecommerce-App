import 'package:flutter/cupertino.dart';

class NetworkResponse{
  final int? responseCode;
  final String? errorMassage;
  final dynamic responseData;
  final bool isSuccess;
  NetworkResponse({
    required this.responseCode,
    required this.isSuccess,
    this.errorMassage='Something Went Wrong',
    this.responseData=null,

  });

}