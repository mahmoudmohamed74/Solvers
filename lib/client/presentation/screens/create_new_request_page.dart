import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:solvers/client/presentation/widgets/default_appbar.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:uuid/uuid.dart';

import 'package:solvers/Auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:solvers/Auth/presentation/widgets/default_text_button.dart';
import 'package:solvers/Auth/presentation/widgets/multi_drop_down%20_button.dart';
import 'package:solvers/client/data/models/order_model.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/client/presentation/screens/requst_done_page.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class ClientNewRequestPage extends StatefulWidget {
  const ClientNewRequestPage({Key? key}) : super(key: key);

  @override
  State<ClientNewRequestPage> createState() => _ClientNewRequestPageState();
}

class _ClientNewRequestPageState extends State<ClientNewRequestPage> {
  final TextEditingController _problemDescriptionEditingController =
      TextEditingController();
  bool isChecked = false;

  final List<String> _specificProblemItems = [
    'Using New Application',
    'Java programming',
    'Backup',
    'Network',
    'Flutter',
    'Dart',
  ];
  final List<String> _mainProblemItems = [
    'Using New Application',
    'Java programming',
    'Backup',
    'Network',
    'Flutter',
    'Dart',
  ];

  List<String> _selectedMainProblemItems = [];
  List<String> _selectedSpecificProblemItems = [];

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<FirebaseAuthCubit>(context);
    var dateTime = DateTime.now();
    var dateTimeFormatted =
        DateFormat('dd/MM/yyyy HH:mm:ss a').format(dateTime);
    final orderId = const Uuid().v4();

    return BlocConsumer<ClientCubit, ClientState>(
      listener: (context, state) {
        if (state is CreateOrderSuccessState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => ClientRequestDonePage(
                orderId: orderId.toString(),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: DefaultAppBar(
            leadingIconButton: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.layoutClient,
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorManager.darkPrimary,
                size: AppSize.s30,
              ),
            ),
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / AppPadding.p20,
                ),
                const Text(
                  "Create New Request",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                MultiDropDownButtonWidget(
                  onSelectionChanged: (selectedItems) {
                    setState(() {
                      _selectedMainProblemItems = selectedItems;
                      print("selected items ${_selectedMainProblemItems}");
                    });
                  },
                  title: "Main problem",
                  items: _mainProblemItems,
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                MultiDropDownButtonWidget(
                  onSelectionChanged: (selectedItems) {
                    setState(() {
                      _selectedSpecificProblemItems = selectedItems;
                      print("selected items ${_selectedSpecificProblemItems}");
                    });
                  },
                  title: "Specific problem",
                  items: _specificProblemItems,
                ),
                const SizedBox(
                  height: AppSize.s30,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppSize.s20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Problem description",
                        style: TextStyle(
                          fontSize: AppSize.s20,
                        ),
                      ),
                      const SizedBox(
                        height: AppSize.s10,
                      ),
                      TextFormField(
                        controller: _problemDescriptionEditingController,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: "Your text here...",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorManager.grey, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorManager.purple, width: 2.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                DefaultTextButton(
                  text: AppStrings.send,
                  fontWeight: FontWeight.normal,
                  onTap: () async {
                    await ClientCubit.get(context).createOrder(
                      OrderModel(
                        clientName: authCubit.clientData!.firstName,
                        clientId: authCubit.clientData!.clientId,
                        dateTime: dateTimeFormatted.toString(),
                        mainProblem: _selectedMainProblemItems,
                        specificProblem: _selectedSpecificProblemItems,
                        problemDescription:
                            _problemDescriptionEditingController.text,
                        orderId: orderId,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
