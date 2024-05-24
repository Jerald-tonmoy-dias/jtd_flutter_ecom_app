import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jtd_flutter_ecom_app/components/shoe_tile.dart';
import 'package:jtd_flutter_ecom_app/models/cart.dart';
import 'package:jtd_flutter_ecom_app/models/shoe.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
// add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user shoe successfulyy added
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text("Successfully added"),
              content: Text("Check your cart"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Center(
              child: Column(
                children: [
                  // search bar
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search",
                          style: TextStyle(color: Colors.grey),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),

                  // message
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Text(
                      "everyone flies.. some fly other than others",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),

                  // hot picks title
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Hot Picks ⚡",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Expanded(
                    child: ListView.builder(
                        itemCount: value.getShoeList().length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          // get shoe list
                          Shoe shoe = value.getShoeList()[index];

                          return ShoeTile(
                            shoe: shoe,
                            onTap: () => addShoeToCart(shoe),
                          );
                        }),
                  ),

                  const Padding(
                    padding:
                        EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
                    child: Divider(
                      color: Colors.transparent,
                    ),
                  )
                ],
              ),
            ));
  }
}
