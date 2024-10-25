import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/providers/wish_list_provider.dart';


class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Build function called!!!");
    final List fruits = [
      "Banana",
      "Grapes",
      "Black Grapes",
      "Mango",
      "Orange",
      "Apple",
      "Strawberry"
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "WishList App",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Colors.white
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: fruits.length,
        itemBuilder: (_,index){
          return Consumer<WishListProvider>(
            builder: (ctx, wishProvider, child){

              /// check item contains or not

             final bool isContain = wishProvider.wishList.contains(fruits[index]);
              return ListTile(
                title: Text(fruits[index].toString(),
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
                ),
                trailing: IconButton(
                  icon:  Icon(
                    isContain
                          ? Icons.favorite
                          : Icons.favorite_border,
                    color: isContain
                        ? Colors.pink
                        : Colors.pink,
                  ),
                  onPressed: () {

                    if(wishProvider.wishList.contains(fruits[index])){

                      /// item remove
                      wishProvider.removeItem(fruits[index].toString());

                    } else {

                      /// item add
                      wishProvider.addItem(fruits[index].toString());
                    }
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
