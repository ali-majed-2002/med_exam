import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mid_ex_flutter/controller/order_controller.dart';
import 'package:mid_ex_flutter/model/order_model.dart';
import 'package:mid_ex_flutter/view/widget/home_wedget.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final OrderController controller = Get.put(OrderController());

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController priceCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
          'Order Items (${controller.orders.length})',
        )),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddDialog(),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Padding(
            padding: const EdgeInsets.all(16),
            child: Obx(() => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Order',
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Total price ${controller.totalPrice.toStringAsFixed(1)}\$',
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )),
          ),

          Expanded(
            child: GetBuilder<OrderController>(
              builder: (_) {
                return ListView.builder(
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    final meal = controller.orders[index];

                    return OrderItemWidget(order: controller.orders[index], onDelete:()=> controller.deleteItem(index));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Add New Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'Meal Name'),
            ),
            TextField(
              controller: priceCtrl,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.addMeal(
                Order(
                  name: nameCtrl.text,
                  img: "image/meal.png",
                  price: double.parse(priceCtrl.text),
                  rating: 4.5,
                  qty: 1,
                ),
              );
              nameCtrl.clear();
              priceCtrl.clear();
              Get.back();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
