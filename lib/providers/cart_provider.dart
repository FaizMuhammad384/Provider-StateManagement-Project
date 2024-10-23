

import 'package:flutter/cupertino.dart';
import 'package:provider_statemanagement/models/product_model.dart';

class CartProvider extends ChangeNotifier {


  List<ProductModel> _products = [];



  /// get product list
  List<ProductModel> get productItems => _products;



  /// add to card
  void addToCard(ProductModel product){
    _products.add(product);
    notifyListeners();
  }


  /// remove to card
  void removeToCard(ProductModel product){
    _products.remove(product);
    notifyListeners();
  }


  /// get total price of product
  getTotalProduct(){
    _products.fold(0, (previousValue, product)
    => int.parse((previousValue + product.product_price).toString()),
    );
    notifyListeners();
  }


}