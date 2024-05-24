import 'package:flutter/material.dart';
import 'package:jtd_flutter_ecom_app/components/cart_item.dart';
import 'package:jtd_flutter_ecom_app/models/cart.dart';
import 'package:jtd_flutter_ecom_app/models/shoe.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        // Debugging: print the cart content
        List<Shoe> cartList = value.getUserCart();
        print("Cart List: ${cartList.length} items");

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // heading
              const Text(
                "My Cart",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: cartList.isEmpty
                    ? const Center(child: Text("Your cart is empty"))
                    : ListView.builder(
                        itemCount: cartList.length,
                        itemBuilder: (context, index) {
                          // get individual shoe
                          Shoe individualShoe = cartList[index];

                          // return the cart item
                          return CartItem(
                            shoe: individualShoe,
                          );
                        },
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
