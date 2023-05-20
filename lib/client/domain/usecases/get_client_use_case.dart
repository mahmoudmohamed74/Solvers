// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:solvers/client/data/models/client_model.dart';
import 'package:solvers/client/domain/repository/base_client_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class GetClientUseCase implements BaseUseCase<ClientModel?, String> {
  final BaseClientRepo _baseClientRepo;

  GetClientUseCase(this._baseClientRepo);

  @override
  Future<ClientModel?> call({required String params}) {
    return _baseClientRepo.getClient(params);
  }
}
