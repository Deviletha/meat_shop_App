import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/item_tile.dart';
import '../provider/fish_items_provider.dart';
import 'cart_page.dart';

class MarinatedItems extends StatelessWidget {
  MarinatedItems({Key? key}) : super(key: key);
  var mitemName = [
    "Chicken",
    "Fish",
    "Beef",
    "Mutton",
  ];
  var mimagePath = [
    "assets/ma_chicken.jpg",
    "assets/ma_fish.jpg",
    "assets/ma_beef.jpg",
    "assets/ma_mutton.jpg",
  ];
  var mitemPrice = [
    "350/Kg",
    "260/Kg",
    "580/Kg",
    "800/Kg",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.black,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartPage();
          },)),
          child: const Icon(Icons.shopping_bag,color: Colors.white,),
        ),
        body: Padding(
          padding:
          const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start ,
              children :[
                Text(
                  "Marinated Items",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(child:
                Consumer<CartProvider>(builder: (context, value, child) {
                  return GridView.builder(
                      itemCount: value.shopItems.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1/1.2),
                      itemBuilder: (context, index) {
                        return ItemTile(
                          ItemName: mitemName[index],
                          ItemPrice: mitemPrice[index],
                          ImagePath: mimagePath[index],
                          color: Colors.green,
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false).addItemToCart(index);
                          },
                        );
                      });
                }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}