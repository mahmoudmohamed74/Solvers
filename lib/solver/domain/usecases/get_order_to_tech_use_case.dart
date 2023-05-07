import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/core/usecase/base_usecase.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';

class GetOrderToTechUseCase implements BaseUseCase<List<OrderModel>, String> {
  final BaseTechRepo _baseTechRepo;

  GetOrderToTechUseCase(this._baseTechRepo);

  @override
  Future<List<OrderModel>> call({required String params}) async {
    return await _baseTechRepo.getOrderToTech(params);
  }
}
