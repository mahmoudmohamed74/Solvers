import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/solver/presentation/screens/home_tech_page.dart';
import 'package:solvers/solver/presentation/screens/my_request_tech_page.dart';
import 'package:solvers/solver/presentation/screens/profile_page_tech.dart';
import 'package:solvers/solver/presentation/screens/request_status_tech_page.dart';

part 'tech_state.dart';

class TechCubit extends Cubit<TechState> {
  TechCubit() : super(TechInitial());

  static TechCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const TechHomePage(),
    const TechMyRequestPage(),
    const TechRequestStatusPage(),
    TechProfilePage(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }
}
