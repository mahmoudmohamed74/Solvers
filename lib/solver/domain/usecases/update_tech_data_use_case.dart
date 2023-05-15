import 'package:solvers/core/usecase/base_usecase.dart';
import 'package:solvers/solver/data/requests/update_tech_data_request.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';

class UpdateTechDataUseCase
    implements BaseUseCase<void, UpdateTechDataRequest> {
  final BaseTechRepo _baseTechRepo;

  UpdateTechDataUseCase(this._baseTechRepo);

  @override
  Future<void> call({required UpdateTechDataRequest params}) async {
    await _baseTechRepo.updateTechData(params);
  }
}
