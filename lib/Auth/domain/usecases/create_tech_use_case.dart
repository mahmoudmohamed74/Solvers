import 'package:solvers/Auth/data/models/tech_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class CreateTechUseCase implements BaseUseCase<void, TechModel> {
  final BaseCreateTechRepo _baseCreateTechRepo;

  CreateTechUseCase(this._baseCreateTechRepo);

  @override
  Future<void> call({required TechModel params}) {
    return _baseCreateTechRepo.createTech(params);
  }
}
