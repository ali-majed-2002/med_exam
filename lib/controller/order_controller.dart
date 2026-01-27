import 'package:get/get.dart';
import 'package:mid_ex_flutter/model/order_model.dart';

class OrderController extends GetxController {
  RxList<Order> orders = <Order>[
    Order(name: 'Beef Burger',img: "image/meal.png", price: 5.3, rating: 4.5, qty: 1),
    Order(name: 'Beef Burger',img: "image/meal.png", price: 20.3, rating: 4.5, qty: 1),
    Order(name: 'Beef Burger',img: "image/meal.png", price: 13.3, rating: 4.5, qty: 1),
  ].obs;

  void addMeal(Order order) {
    orders.add(order);
    update(); // GetBuilder
  }

  void deleteItem(int index) {
    orders.removeAt(index);
    update(); // GetBuilder
  }

  double get totalPrice =>
      orders.fold(0, (sum, item) => sum + item.price);
}
