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
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      color: Color(0xfffefefe),
      child: Stack(

        children: [
          Positioned(
            right: 0,
            top: 0,
            child: InkWell(
            onLongPress: onDelete,
            child: const CircleAvatar(
              radius: 12,
              backgroundColor: Color(0xffd4d100),
              child: Icon(Icons.close, size: 14, color: Colors.white),
            ),
          ),),
          ListTile(
            leading: CircleAvatar(
              child: Image.asset(order.img),
            ),
            title: Text(order.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${order.price} \$'),

              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text('${order.qty} pcs',style: TextStyle(fontSize: 16),),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(order.rating.toString(),style: TextStyle(
                      fontSize: 14
                    ),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}