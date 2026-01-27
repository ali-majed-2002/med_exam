import 'package:flutter/material.dart';
import 'package:mid_ex_flutter/model/order_model.dart';



class OrderItemWidget extends StatelessWidget {
  final Order order;
  final VoidCallback onDelete;


  const OrderItemWidget({
    super.key,
    required this.order,
    required this.onDelete,
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset(order.img),
        ),
        title: Text(order.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${order.price} \$'),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.orange, size: 16),
                const SizedBox(width: 4),
                Text(order.rating.toString()),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onDelete,
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.green,
                child: Icon(Icons.close, size: 14, color: Colors.white),
              ),
            ),
            Text('${order.qty} pcs'),
          ],
        ),
      ),
    );
  }
}