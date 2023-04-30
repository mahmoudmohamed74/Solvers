import 'package:solvers/client/data/models/order_model.dart';

abstract class BaseCreateOrderRepo {
  Future<void> createOrder(OrderModel orderModel);
}
