import 'package:solvers/client/data/datasource/create_order.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/domain/repository/base_create_order_repo.dart';

class CreateOrderRepoImpl implements BaseCreateOrderRepo {
  final FireStoreCreateOrder fireStoreCreateOrder;

  CreateOrderRepoImpl(this.fireStoreCreateOrder);

  @override
  Future<void> createOrder(OrderModel order) async {
    try {
      await fireStoreCreateOrder.addOrderToFireStore(order);
    } catch (e) {
      print("create order error repo : ${e.toString()}");
    }
  }
}
