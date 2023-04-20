import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/widgets/appbar_widget.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class ClientOffersPage extends StatelessWidget {
  const ClientOffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / AppSize.s50,
            ),
            const Text(
              "Offers",
              style: TextStyle(
                fontSize: AppSize.s40,
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Request Number",
                style: TextStyle(
                  fontSize: AppSize.s32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "1234566",
                style: TextStyle(
                  fontSize: AppSize.s32,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: Container(
                    height: AppSize.s180,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      color: ColorManager.primary,
                      borderRadius: BorderRadius.circular(AppSize.s15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: AppSize.s2,
                          blurRadius: AppSize.s5,
                          offset: const Offset(AppSize.s0, AppSize.s3),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: AppPadding.p20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: AppSize.s30,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: AppPadding.p35,
                            ),
                            child: Text(
                              "Request number: ****",
                              style: TextStyle(
                                fontSize: AppSize.s15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            children: [
                              Image.asset(ImageAssets.dateTime),
                              const SizedBox(
                                width: AppSize.s10,
                              ),
                              const Text(
                                "Date:dd/mm/yyyy",
                                style: TextStyle(
                                  fontSize: AppSize.s15,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              left: AppPadding.p35,
                            ),
                            child: Text(
                              "Status: New",
                              style: TextStyle(
                                fontSize: AppSize.s15,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: AppPadding.p35,
                            ),
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "view details",
                                style: TextStyle(
                                  fontSize: AppSize.s12,
                                  color: ColorManager.purple,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
