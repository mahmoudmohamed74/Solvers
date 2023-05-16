import 'package:solvers/Auth/data/models/tech_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';

class GetTechUseCase implements BaseUseCase<TechModel?, String> {
  final BaseTechRepo _baseTechRepo;

  GetTechUseCase(this._baseTechRepo);

  @override
  Future<TechModel?> call({required String params}) {
    return _baseTechRepo.getTech(params);
  }
}
