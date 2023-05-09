import 'package:solvers/client/domain/entities/update_order_offer.dart';
import 'package:solvers/client/domain/repository/base_create_order_repo.dart';
import 'package:solvers/core/usecase/base_usecase.dart';

class UpdateOrderOfferUseCase implements BaseUseCase<void, UpdateOrderOffer> {
  final BaseCreateOrderRepo _baseCreateOrderRepo;

  UpdateOrderOfferUseCase(this._baseCreateOrderRepo);

  @override
  Future<void> call({required UpdateOrderOffer params}) async {
    await _baseCreateOrderRepo.updateOrderOffer(params);
  }
}
