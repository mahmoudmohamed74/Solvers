import 'package:flutter/material.dart';
import 'package:solvers/client/presentation/widgets/appbar_widget.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class ClientOffersPage extends StatelessWidget {
  final String? orderId;
  const ClientOffersPage({Key? key, this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
              Align(
                alignment: Alignment.center,
                child: Text(
                  orderId!.substring(0, 8),
                  style: const TextStyle(
                    fontSize: AppSize.s32,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                          Row(
                            children: [
                              Image.asset(
                                ImageAssets.personPhoto,
                                scale: 1.8,
                              ),
                              const SizedBox(
                                width: AppSize.s10,
                              ),
                              const Text(
                                "Tech name",
                                style: TextStyle(
                                  fontSize: AppSize.s20,
                                ),
                              ),
                              const SizedBox(
                                width: AppSize.s10,
                              ),
                              Image.asset(
                                ImageAssets.smallPerson,
                              ),
                            ],
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
                                "offer date: dd/mm/yyyy",
                                style: TextStyle(
                                  fontSize: AppSize.s20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: AppSize.s36,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Price",
                                      style: TextStyle(
                                        fontSize: AppSize.s20,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Text(
                                        "view details",
                                        style: TextStyle(
                                          fontSize: AppSize.s14,
                                          color: ColorManager.purple,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: AppSize.s60,
                              ),
                              InkWell(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      ImageAssets.greenBox,
                                    ),
                                    Image.asset(
                                      ImageAssets.smallTrue,
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                              const SizedBox(
                                width: AppSize.s5,
                              ),
                              InkWell(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      ImageAssets.redBox,
                                    ),
                                    Image.asset(
                                      ImageAssets.rightLine,
                                    ),
                                    Image.asset(
                                      ImageAssets.leftLine,
                                    ),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
