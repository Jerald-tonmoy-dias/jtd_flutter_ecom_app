import 'package:flutter/material.dart';
import 'package:jtd_flutter_ecom_app/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
      name: "shei shoe",
      price: '200',
      imagePath: 'lib/images/p1.webp',
      description: "cool shoe",
    ),
    Shoe(
      name: "Osthir shoe",
      price: '300',
      imagePath: 'lib/images/p2.webp',
      description: "cool shoe",
    ),
    Shoe(
      name: "Wow shoe",
      price: '300',
      imagePath: 'lib/images/p3.webp',
      description: "cool shoe",
    ),
    Shoe(
      name: "Awesome shoe",
      price: '300',
      imagePath: 'lib/images/p4.webp',
      description: "cool shoe",
    ),
    Shoe(
      name: "Xoss shoe",
      price: '300',
      imagePath: 'lib/images/p5.webp',
      description: "cool shoe",
    ),
    Shoe(
      name: "jotil shoe",
      price: '300',
      imagePath: 'lib/images/p6.webp',
      description: "cool shoe",
    ),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove item from cart
  void removeItemToCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
