import 'package:solvers/Auth/data/models/tech_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class GetTechUseCase implements BaseUseCase<TechModel?, String> {
  final BaseCreateTechRepo _baseCreateTechRepo;

  GetTechUseCase(this._baseCreateTechRepo);

  @override
  Future<TechModel?> call({required String params}) {
    return _baseCreateTechRepo.getTech(params);
  }
}
