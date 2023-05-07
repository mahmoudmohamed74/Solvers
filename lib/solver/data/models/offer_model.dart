import 'package:equatable/equatable.dart';

class OfferModel extends Equatable {
  final String techName;
  final String techId;
  final String price;
  final String earnest;
  final String offerDescription;
  final String offerDate;
  final String accepted;

  const OfferModel({
    required this.techName,
    required this.techId,
    required this.price,
    required this.earnest,
    required this.offerDescription,
    required this.offerDate,
    this.accepted = '',
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'techName': techName,
      'techId': techId,
      'price': price,
      'earnest': earnest,
      'offerDescription': offerDescription,
      'offerDate': offerDate,
      'accepted': accepted,
    };
  }

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      techName: json['techName'],
      techId: json['techId'],
      price: json['price'],
      earnest: json['earnest'],
      offerDescription: json['offerDescription'],
      offerDate: json['offerDate'],
      accepted: json['accepted'],
    );
  }

  @override
  List<Object> get props {
    return [
      techName,
      techId,
      price,
      earnest,
      offerDescription,
      offerDate,
      accepted,
    ];
  }
}
