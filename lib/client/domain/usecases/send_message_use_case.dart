import 'package:solvers/client/domain/repository/base_client_repo.dart';
import 'package:solvers/core/messages/message_model.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class ClientSendMessageUseCase implements BaseUseCase<void, MessageModel> {
  final BaseClientRepo _baseClientRepo;

  ClientSendMessageUseCase(this._baseClientRepo);

  @override
  Future<void> call({required MessageModel params}) async {
    await _baseClientRepo.clientSendMessage(params);
  }
}
