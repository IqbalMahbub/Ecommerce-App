import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utility/app_color.dart';
import '../utility/assets_path.dart';

class PoductCard extends StatelessWidget {
  const PoductCard({
    super.key, this.showAddWishList=true,
  });
final bool showAddWishList;
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor:Colors.white ,
      elevation: 3,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
      ),
      child: SizedBox(
        width: 150,
        child: Column(
          children: [
            Container(
              width: 150,
              decoration: BoxDecoration(
                color: AppColores.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)
                ),
              ),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AssetsPath.productDummyImgPng),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nike Sport Shoe 320K Special Esition ",maxLines:1
                    ,style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500
                    ),),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing:10 ,
                    alignment: WrapAlignment.start,
                    children: [
                      Text('\$30',style: TextStyle(
                          fontWeight:FontWeight.w600,
                          fontSize: 16,
                          color: AppColores.primaryColor
                      ),),
                      Wrap(
                        children: [
                          Icon(Icons.star,color: Colors.amber,size:
                          20,) ,
                          Text('3.4'),
                        ],
                      ),
                      buildAddToWishButton()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAddToWishButton() {
    return Visibility(
                      visible: showAddWishList,
                      replacement:_getIconButton(Icons.delete_outline),
                      child:_getIconButton(Icons.favorite_outline),
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

}
