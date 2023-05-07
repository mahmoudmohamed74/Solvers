import 'package:solvers/client/domain/repository/base_create_order_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class UpdateOfferAcceptedTypeUseCase
    implements BaseUseCaseThreeParams<void, String, String, String> {
  final BaseCreateOrderRepo _baseCreateOrderRepo;

  UpdateOfferAcceptedTypeUseCase(this._baseCreateOrderRepo);

  @override
  Future<void> call({
    required String paramsOne,
    required String paramsTwo,
    required String paramsThree,
  }) async {
    await _baseCreateOrderRepo.updateOfferAcceptedType(
      paramsOne,
      paramsTwo,
      paramsThree,
    );
  }
}
