import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/constants/constant.dart';
import 'package:provider_statemanagement/models/product_model.dart';
import 'package:provider_statemanagement/providers/cart_provider.dart';
import 'package:provider_statemanagement/views/screens/cart_details_screen.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("build function called!!!");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Products",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CartDetailsScreen()));
            },
            icon: Badge(
              label: Text(
                  context.watch<CartProvider>().productItems.length.toString()),
              child: const Icon(Icons.shopping_cart, color: Colors.white),
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (_, index) {
              ProductModel productModel = productsList[index];
              return Consumer<CartProvider>(
                builder: (ctx, product, child) {
                  return ListTile(
                    title: Text(
                      productModel.product_name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                      ),
                    ),
                    subtitle: Text("${productModel.product_price}"),
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: productModel.produc_color,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    trailing: Checkbox(
                      value: product.productItems.contains(productModel),
                      onChanged: (newValue) {
                        if (newValue == true) {
                          product.addToCard(productModel);
                        } else {
                          product.removeToCard(productModel);
                        }
                      },
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
