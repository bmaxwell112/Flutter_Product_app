import 'package:flutter/material.dart';
import 'dart:async';
import '../widgets/products/price_tag.dart';
import '../widgets/ui_elements/title_default.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  ProductPage(this.product);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('back button pressed');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(product.title),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(product.image),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TitleDefault(product.title),
                  SizedBox(width: 8.0),
                  PriceTag(product.price.toString()),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(product.description),
            ),
          ],
        ),
      ),
    );
  }
}
