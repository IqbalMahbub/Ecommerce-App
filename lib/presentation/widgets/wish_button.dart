import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class WishButton extends StatelessWidget {
  const WishButton({super.key, this.showAddWishList=true, this.isSelected=false, required this.onTap});
final showAddWishList ;
final bool isSelected;
final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showAddWishList,
      replacement:_getIconButton(Icons.delete_outline),
      child:InkWell(
        onTap: onTap,
          child: _getIconButton(_getIconData())),
    );
  }

  Widget _getIconButton(IconData icon){
    return  Card(
      color: AppColores.primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(4)
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0),
        child: Icon(icon,
          size: 16,color: Colors.white,),
      ),
    );
  }
  IconData _getIconData(){
    return isSelected ? Icons.favorite:Icons.favorite_outline;
  }
}
