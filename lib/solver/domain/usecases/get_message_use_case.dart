import 'package:solvers/core/messages/message_model.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';

class TechGetMessagesUseCase {
  final BaseTechRepo _baseTechRepo;

  TechGetMessagesUseCase(this._baseTechRepo);

  Stream<List<MessageModel>> execute(String senderId, String receiverId) {
    return _baseTechRepo.techGetMessage(senderId, receiverId);
  }
}
