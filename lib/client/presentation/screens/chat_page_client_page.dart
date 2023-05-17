import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solvers/Auth/presentation/widgets/default_form_field.dart';
import 'package:solvers/client/presentation/controller/client_cubit.dart';
import 'package:solvers/client/presentation/widgets/default_appbar.dart';
import 'package:solvers/Auth/presentation/widgets/message_widget.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/strings_manger.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/routes/app_routes.dart';

class ClientChatPage extends StatelessWidget {
  final String? techId;
  final String? techName;
  final TextEditingController _messageController = TextEditingController();
  // final _focusNode = FocusScopeNode();

  ClientChatPage({Key? key, this.techId, this.techName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ClientCubit>(context)
      ..clientGetMessages(techId!);
    // final clientCubit = ClientCubit.get(context);
    return Scaffold(
      appBar: DefaultAppBar(
        appBarText: techName!,
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
      body: BlocConsumer<ClientCubit, ClientState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p20,
            ),
            child: Column(
              children: [
                if (state is ChatLoading)
                  Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.purple,
                    ),
                  ),
                if (state is ChatLoaded)
                  ConditionalBuilder(
                    condition: state.message.isNotEmpty,
                    builder: (context) {
                      return Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: state.message[index].senderId! ==
                                      cubit.clientId
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: MessageWidget(
                                message: state.message[index].message!,
                                color: state.message[index].senderId! ==
                                        cubit.clientId
                                    ? ColorManager.bottomAbbBar
                                    : ColorManager.primary,
                                isOwn: state.message[index].senderId! ==
                                        cubit.clientId
                                    ? true
                                    : false,
                              ),
                            );
                          },
                          itemCount: state.message.length,
                        ),
                      );
                    },
                    fallback: (context) => SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "You do'nt have any messages yet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: AppSize.s32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _messageController,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorManager.white,
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: "Type message...",
                          filled: true,
                          fillColor: ColorManager.bottomAbbBar,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s10,
                    ),
                    Container(
                      width: 70,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.green,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            spreadRadius: AppSize.s2,
                            blurRadius: AppSize.s5,
                            offset: const Offset(AppSize.s0, AppSize.s3),
                          )
                        ],
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          await cubit.clientSendMessage(
                            receiverId: techId!,
                            message: _messageController.text,
                          );
                          print(_messageController.text);
                          _messageController.clear();
                        },
                        child: const Text(
                          AppStrings.send,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppSize.s16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
