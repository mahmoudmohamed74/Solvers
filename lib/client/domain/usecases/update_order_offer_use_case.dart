import 'package:solvers/client/data/requests/update_order_offer_request.dart';
import 'package:solvers/client/domain/repository/base_client_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class UpdateOrderOfferUseCase implements BaseUseCase<void, UpdateOrderOffer> {
  final BaseClientRepo _baseClientRepo;

  UpdateOrderOfferUseCase(this._baseClientRepo);

  @override
  Future<void> call({required UpdateOrderOffer params}) async {
    await _baseClientRepo.updateOrderOffer(params);
  }
}
