import 'package:solvers/core/usecase/base_usecase.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';

class UpdateOrderAcceptedTypeUseCase
    implements BaseUseCaseTwoParams<void, String, String> {
  final BaseTechRepo _baseTechRepo;

  UpdateOrderAcceptedTypeUseCase(this._baseTechRepo);

  @override
  Future<void> call({
    required String paramsOne,
    required String paramsTwo,
  }) async {
    await _baseTechRepo.declineOrder(paramsOne, paramsTwo);
  }
}
