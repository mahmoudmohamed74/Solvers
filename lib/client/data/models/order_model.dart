import 'package:equatable/equatable.dart';

class OrderModel extends Equatable {
  final String clientName;
  final String clientId;
  final String dateTime;
  final List<String> mainProblem;
  final List<String> specificProblem;
  final String problemDescription;

  const OrderModel({
    required this.clientName,
    required this.clientId,
    required this.dateTime,
    required this.mainProblem,
    required this.specificProblem,
    required this.problemDescription,
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
    ];
  }
}
