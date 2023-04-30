// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:solvers/Auth/data/models/client_model.dart';
import 'package:solvers/Auth/domain/repository/base_create_user_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class GetClientUseCase implements BaseUseCase<ClientModel?, String> {
  final BaseCreateClientRepo _baseCreateClientRepo;

  GetClientUseCase(
    this._baseCreateClientRepo,
  );
  @override
  Future<ClientModel?> call({required String params}) {
    return _baseCreateClientRepo.getClient(params);
  }
}
