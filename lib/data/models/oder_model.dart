import 'package:ecommerce_woocom/data/enum/order_payment_status.dart';
import 'package:ecommerce_woocom/data/enum/order_status.dart';

class OrderModel {
  int id;
  String orderId;
  String date;
  String customer;
  OrderPaymentStatus payStatus;
  OrderStatus orderStatus;
  double total;

  OrderModel(this.id, this.orderId, this.date, this.customer, this.payStatus,
      this.orderStatus, this.total);
}
