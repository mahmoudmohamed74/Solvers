class UpdateOrderOffer {
  final String orderDocId;
  final String status;
  final String techName;
  final String price;
  final String earnest;
  final String techId;
  final String isAcceptedOffer;
  final String earnestIsPaid;
  final String priceIsPaid;

  UpdateOrderOffer({
    required this.orderDocId,
    required this.status,
    required this.techName,
    required this.price,
    required this.earnest,
    required this.techId,
    required this.isAcceptedOffer,
    required this.earnestIsPaid,
    required this.priceIsPaid,
  });
}
