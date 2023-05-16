import 'package:solvers/client/data/requests/update_client_data_request.dart';
import 'package:solvers/client/domain/repository/base_client_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class UpdateClientDataUseCase
    implements BaseUseCase<void, UpdateClientDataRequest> {
  final BaseClientRepo _baseClientRepo;

  UpdateClientDataUseCase(this._baseClientRepo);

  @override
  Future<void> call({required UpdateClientDataRequest params}) async {
    await _baseClientRepo.updateClientData(params);
  }
}
