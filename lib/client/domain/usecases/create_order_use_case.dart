import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/domain/repository/base_client_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class CreateOrderUseCase implements BaseUseCase<void, OrderModel> {
  final BaseClientRepo _baseClientRepo;

  CreateOrderUseCase(this._baseClientRepo);
  @override
  Future<void> call({required OrderModel params}) async {
    return await _baseClientRepo.createOrder(params);
  }
}
