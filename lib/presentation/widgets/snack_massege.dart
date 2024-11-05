import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showSnackMassage(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
