
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarIcon extends StatelessWidget {
  const AppbarIcon({
    super.key, required this.onTap,required this.icon
  });
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: CircleAvatar(
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon,color: Colors.grey,size: 20,),
      ),
    );
  }
}
