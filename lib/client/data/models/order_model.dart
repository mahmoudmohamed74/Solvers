import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final String clientName;
  final String techName;
  final String clientId;
  final String dateTime;
  final List<String> mainProblem;
  final List<String> specificProblem;
  final String problemDescription;
  final String status;
  final String orderId;
  final String orderDocId;
  final String earnest;
  final String price;
  final String earnestIsPaid;
  final String priceIsPaid;
  final String techId;
  final List<String> refusedIds;

  const OrderModel({
    required this.clientName,
    required this.clientId,
    required this.dateTime,
    required this.mainProblem,
    required this.specificProblem,
    required this.problemDescription,
    required this.orderId,
    this.status = 'new',
    this.orderDocId = '',
    this.techName = '',
    this.earnest = '0',
    this.price = '0',
    this.techId = '',
    this.earnestIsPaid = '',
    this.priceIsPaid = '',
    this.refusedIds = const [],
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      clientName: json['clientName'],
      clientId: json['clientId'],
      dateTime: json['dateTime'],
      mainProblem: List<String>.from(
        (json['mainProblem']),
      ),
      specificProblem: List<String>.from(
        (json['specificProblem']),
      ),
      problemDescription: json['problem'],
      status: json['status'],
      orderId: json['orderId'],
      orderDocId: json['orderDocId'],
      techName: json['techName'],
      earnest: json['earnest'],
      price: json['price'],
      techId: json['techId'],
      earnestIsPaid: json['earnestIsPaid'],
      priceIsPaid: json['priceIsPaid'],
      refusedIds: List<String>.from(
        (json['refusedIds']),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'clientName': clientName,
      'clientId': clientId,
      'dateTime': dateTime,
      'mainProblem': mainProblem,
      'specificProblem': specificProblem,
      'problem': problemDescription,
      'status': status,
      'orderId': orderId,
      'orderDocId': orderDocId,
      'techName': techName,
      'earnest': earnest,
      'price': price,
      'techId': techId,
      'refusedIds': refusedIds,
      'earnestIsPaid': earnestIsPaid,
      'priceIsPaid': priceIsPaid,
    };
  }

  @override
  List<Object> get props {
    return [
      clientName,
      clientId,
      dateTime,
      mainProblem,
      specificProblem,
      problemDescription,
      status,
      orderId,
      orderDocId,
      techName,
      earnest,
      price,
      techId,
      refusedIds,
      earnestIsPaid,
      priceIsPaid,
    ];
  }
}
