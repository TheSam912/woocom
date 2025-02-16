import 'package:ecommerce_woocom/data/enum/order_payment_status.dart';
import 'package:ecommerce_woocom/data/enum/order_status.dart';
import 'package:ecommerce_woocom/data/models/oder_model.dart';

class OrderRepository {
  static List orderList = [
    OrderModel(0, "#12512B", "May 5, 4:20 PM", "Tom Anderson",
        OrderPaymentStatus.paid, OrderStatus.orderReady, 49.90),
    OrderModel(1, "#12523C", "May 5, 4:15 PM", "Jayden Walker",
        OrderPaymentStatus.paid, OrderStatus.orderReady, 59.70),
    OrderModel(2, "#23534D", "May 5, 4:12 PM", "Francisco Henry",
        OrderPaymentStatus.paid, OrderStatus.orderShipped, 29.74),
    OrderModel(3, "#23534D", "May 5, 4:04 PM", "Miguel Harris",
        OrderPaymentStatus.pending, OrderStatus.orderReady, 89.00),
    OrderModel(4, "#51232A", "May 5, 4:03 PM", "Rosalie Singleton",
        OrderPaymentStatus.failed, OrderStatus.orderCanceled, 10.15),
    OrderModel(0, "#12512B", "May 5, 4:20 PM", "Tom Anderson",
        OrderPaymentStatus.paid, OrderStatus.orderReady, 49.90),
    OrderModel(1, "#12523C", "May 5, 4:15 PM", "Jayden Walker",
        OrderPaymentStatus.paid, OrderStatus.orderReceived, 59.70),
    OrderModel(2, "#23534D", "May 5, 4:12 PM", "Francisco Henry",
        OrderPaymentStatus.paid, OrderStatus.orderShipped, 29.74),
    OrderModel(3, "#23534D", "May 5, 4:04 PM", "Miguel Harris",
        OrderPaymentStatus.pending, OrderStatus.orderReady, 89.00),
    OrderModel(4, "#51232A", "May 5, 4:03 PM", "Rosalie Singleton",
        OrderPaymentStatus.failed, OrderStatus.orderReceived, 10.15),
  ];
}
