import 'package:solvers/core/usecase/base_usecase.dart';
import 'package:solvers/solver/data/models/offer_model.dart';
import 'package:solvers/solver/domain/repository/base_tech_repo.dart';

class CreateOfferUseCase
    implements BaseUseCaseTwoParams<void, OfferModel, String> {
  final BaseTechRepo _baseTechRepo;

  CreateOfferUseCase(this._baseTechRepo);

  @override
  Future<void> call({
    required OfferModel paramsOne,
    required String paramsTwo,
  }) async {
    await _baseTechRepo.createOffer(paramsOne, paramsTwo);
  }
}
