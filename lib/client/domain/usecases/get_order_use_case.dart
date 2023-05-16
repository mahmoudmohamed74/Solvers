import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/domain/repository/base_client_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class GetOrderToClientUseCase implements BaseUseCase<List<OrderModel>, String> {
  final BaseClientRepo _baseClientRepo;

  GetOrderToClientUseCase(this._baseClientRepo);

  @override
  Future<List<OrderModel>> call({required String params}) async {
    return await _baseClientRepo.getOrderToClient(params);
  }
}
