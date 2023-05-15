import 'package:solvers/client/domain/repository/base_create_order_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class GetAllOffersToClientUseCase
    implements BaseUseCase<List<OfferModel>, String> {
  final BaseClientRepo _baseClientRepo;

  GetAllOffersToClientUseCase(this._baseClientRepo);

  @override
  Future<List<OfferModel>> call({required String params}) async {
    return await _baseClientRepo.getOrderAllOffersTOClient(params);
  }
}
