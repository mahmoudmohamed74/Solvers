import 'package:solvers/client/domain/repository/base_client_repo.dart';
import 'package:solvers/core/messages/message_model.dart';

class ClientGetMessagesUseCase {
  final BaseClientRepo _baseClientRepo;

  ClientGetMessagesUseCase(this._baseClientRepo);

  Stream<List<MessageModel>> execute(String senderId, String receiverId) {
    return _baseClientRepo.clientGetMessage(senderId, receiverId);
  }
}
