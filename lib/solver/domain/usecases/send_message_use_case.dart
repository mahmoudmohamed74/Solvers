import 'package:solvers/core/messages/message_model.dart';
import 'package:solvers/core/usecase/base_usecase.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';

class TechSendMessageUseCase implements BaseUseCase<void, MessageModel> {
  final BaseTechRepo _baseTechRepo;

  TechSendMessageUseCase(this._baseTechRepo);

  @override
  Future<void> call({required MessageModel params}) async {
    await _baseTechRepo.techSendMessage(params);
  }
}
