import 'package:first_app/scoped_models/main.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './price_tag.dart';
import '../ui_elements/title_default.dart';
import './address_tag.dart';
import '../../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  const ProductCard(this.product, this.productIndex);

  Widget _buildTitleAndPrice() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(product.title),
          SizedBox(width: 8.0),
          PriceTag(product.price.toString()),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ButtonBar(
          alignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.info),
              color: Theme.of(context).primaryColor,
              onPressed: () => Navigator.pushNamed<bool>(
                    context,
                    '/product/' + model.allProducts[productIndex].id,
                  ),
            ),
            IconButton(
              color: Colors.red,
              icon: Icon(model.allProducts[productIndex].isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border),
              onPressed: () {
                model.selectProduct(model.allProducts[productIndex].title);
                model.toggleProductFavoriteStatus();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product.image),
          _buildTitleAndPrice(),
          AddressTag('Union Square, San Francisco'),
          SizedBox(height: 10.0),
          Text(
            product.userEmail,
            style: TextStyle(color: Colors.grey),
          ),
          _buildActionButtons(context),
        ],
      ),
    );
  }
}
