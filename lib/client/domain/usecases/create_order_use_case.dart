import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/domain/repository/base_create_order_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class CreateOrderUseCase implements BaseUseCase<void, OrderModel> {
  final BaseCreateOrderRepo _baseCreateOrderRepo;

  CreateOrderUseCase(this._baseCreateOrderRepo);
  @override
  Future<void> call({required OrderModel params}) async {
    return _baseCreateOrderRepo.createOrder(params);
  }
}
