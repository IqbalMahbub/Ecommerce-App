import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/product_cart.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryName});


   final String categoryName;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryName),),
      body: GridView.builder(
          itemCount: 15,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount
            (crossAxisCount: 3,childAspectRatio: 0.8),
          itemBuilder: (context,indexconst ){
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
              child: FittedBox(child:PoductCard()),
            );
          }
      ),
    );
  }
}
