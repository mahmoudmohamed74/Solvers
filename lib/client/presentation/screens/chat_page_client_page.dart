import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/widgets/default_appbar.dart';
import 'package:solvers/client/presentation/widgets/message_widget.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';
import 'package:solvers/core/routes/app_routes.dart';
import 'package:solvers/solver/data/models/offer_model.dart';

class ClientChatPage extends StatelessWidget {
  final OfferModel? offerModel;
  final String? clientId;
  const ClientChatPage({
    Key? key,
    this.offerModel,
    this.clientId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: MessageWidget(
                      message: "hi",
                      color: ColorManager.green,
                      isOwn: true,
                    ),
                  );
                },
                itemCount: 40,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorManager.selectedItem,
        notchMargin: 8,
        child: SizedBox(
            height: 60,
            child: TextField(
              // controller: messageController,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  child: Icon(Icons.send),
                  onTap: () {
                    // Send Message to Firestore
                    // cubit.sendMessage(message: messageController.text, receiverID: userModel.id!);
                  },
                ),
                border: const OutlineInputBorder(),
              ),
            )),
      ),
    );
  }
}
