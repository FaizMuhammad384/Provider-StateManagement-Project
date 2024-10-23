import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/providers/cart_provider.dart';



class CartDetailsScreen extends StatelessWidget {
  const CartDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart Details",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Consumer<CartProvider>(
          builder: (ctx, cartProvider, child) {
          return Column(
            children: [
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.productItems.length,
                  itemBuilder: (context, index) {
                    var product = cartProvider.productItems[index];
                    return ListTile(
                      title: Text(
                        product.product_name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text("${product.product_price}"),
                    );
                  },
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total Price:",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    // context.read<CartProvider>().getTotalProduct().toString(),
                    cartProvider.getTotalProduct().toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ),
             const SizedBox(height: 50),
            ],
          );
        },
      )),
    );
  }
}
