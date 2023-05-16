import 'package:solvers/Auth/data/models/tech_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class CreateTechUseCase implements BaseUseCase<void, TechModel> {
  final BaseCreateUserRepo _baseCreateUserRepo;

  CreateTechUseCase(this._baseCreateUserRepo);

  @override
  Future<void> call({required TechModel params}) {
    return _baseCreateUserRepo.createTech(params);
  }
}
