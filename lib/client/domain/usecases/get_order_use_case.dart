import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/domain/repository/base_create_order_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class GetOrderToClientUseCase
    implements BaseUseCase<List<OrderModel>?, String> {
  final BaseCreateOrderRepo _baseCreateOrderRepo;

  GetOrderToClientUseCase(this._baseCreateOrderRepo);

  @override
  Future<List<OrderModel>?> call({required String params}) async {
    return await _baseCreateOrderRepo.getOrderToClient(params);
  }
}
