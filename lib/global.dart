import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

String lorem =
    "Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptas at, aspernatur blanditiis veritatis nam ea corrupti architecto, ipsum dolor sunt facere quasi, laborum fugiat earum laudantium adipisci corporis esse magnam.";

class Product {
  final String title, description, price, img;
  Product({
    this.title,
    this.description,
    this.price,
    this.img,
  });
}

List<Product> productsList = [
  Product(
    description: lorem,
    title: "About Us",
    price: "\₹8.99",
    img: "assets/img/06.png",
  ),
  Product(
    description: lorem,
    title: "Place your Order",
    price: "\₹5.93",
    img: "assets/img/11.png",
  ),
  Product(
    description: lorem,
    title: "Party Booking",
    price: "\₹6.99",
    img: "assets/img/09.png",
  ),
  Product(
    description: lorem,
    title: "Event",
    price: "\₹8.99",
    img: "assets/img/10.png",
  ),
  Product(
    description: lorem,
    title: "Billiards",
    price: "\₹8.99",
    img: "assets/img/08.png",
  ),
  Product(
    description: lorem,
    title: "Club Features",
    price: "\₹8.99",
    img: "assets/img/04.png",
  ),
  Product(
    description: lorem,
    title: "Hygine",
    price: "\₹8.99",
    img: "assets/img/02.png",
  ),
  Product(
    description: lorem,
    title: "T & C",
    price: "\₹8.99",
    img: "assets/img/tc.png",
  ),
];

class Category {
  final String title;
  final IconData icon;

  Category({this.title, this.icon});
}

List<Category> cats = [
  Category(
    icon: MaterialCommunityIcons.hamburger,
    title: "Hamburger",
  ),
  Category(
    icon: MaterialIcons.local_pizza,
    title: "Pizza",
  ),
  Category(
    icon: FontAwesome.coffee,
    title: "Coffee",
  ),
  Category(
    icon: MaterialIcons.local_drink,
    title: "Milk",
  ),
  Category(
    icon: MaterialCommunityIcons.tea,
    title: "Tea",
  ),
];
