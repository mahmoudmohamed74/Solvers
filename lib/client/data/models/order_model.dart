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
  final String accepted;
  final String earnest;
  final String price;

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
    this.accepted = '',
    this.techName = '',
    this.earnest = '0',
    this.price = '0',
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
      accepted: json['accepted'],
      techName: json['techName'],
      earnest: json['earnest'],
      price: json['price'],
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
      'accepted': accepted,
      'techName': techName,
      'earnest': earnest,
      'price': price,
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
      accepted,
      techName,
      earnest,
      price,
    ];
  }
}
