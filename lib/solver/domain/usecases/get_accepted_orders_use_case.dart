import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/core/usecase/base_usecase.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';

class GetAcceptedOrdersUseCase
    implements BaseUseCase<List<OrderModel>, String> {
  final BaseTechRepo _baseTechRepo;

  GetAcceptedOrdersUseCase(this._baseTechRepo);

  @override
  Future<List<OrderModel>> call({required String params}) async {
    return await _baseTechRepo.getAcceptedOrders(params);
  }
}
