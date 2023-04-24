import 'package:flutter/material.dart';
import 'package:solvers/core/assets/app_assets.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class TechRequestStatusPage extends StatelessWidget {
  const TechRequestStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: AppPadding.p10,
                left: AppPadding.p20,
              ),
              child: Text(
                "Requests",
                style: TextStyle(
                  fontSize: AppSize.s36,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => Stack(
                children: [
                  Padding(
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
                              height: AppSize.s20,
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
                              height: AppSize.s5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppPadding.p10,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.smallPerson,
                                  ),
                                  const SizedBox(
                                    width: AppSize.s10,
                                  ),
                                  const Text(
                                    "Tech name",
                                    style: TextStyle(
                                      fontSize: AppSize.s15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppPadding.p6,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(ImageAssets.dateTime),
                                  const SizedBox(
                                    width: AppSize.s5,
                                  ),
                                  const Text(
                                    "Date and time :dd/mm/yyyy   00:00 am",
                                    style: TextStyle(
                                      fontSize: AppSize.s15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s5,
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
                            const SizedBox(
                              height: AppSize.s5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppPadding.p35,
                              ),
                              child: Row(
                                children: [
                                  const Text(
                                    "Problem: ",
                                    style: TextStyle(
                                      fontSize: AppSize.s15,
                                    ),
                                  ),
                                  const Text(
                                    "Java programming,",
                                    style: TextStyle(
                                      fontSize: AppSize.s14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: AppSize.s5,
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Read more",
                                      style: TextStyle(
                                        fontSize: AppSize.s12,
                                        color: ColorManager.purple,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s5,
                            ),
                            // const Padding(
                            //   padding: EdgeInsets.only(
                            //     left: AppPadding.p35,
                            //   ),
                            //   child: Text(
                            //     "Price: 30 SR",
                            //     style: TextStyle(
                            //       fontSize: AppSize.s15,
                            //     ),
                            //   ),
                            // ),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
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
                  const Padding(
                    padding: EdgeInsets.all(AppPadding.p8),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: AppSize.s14,
                      ),
                    ),
                  ),
                ],
              ),
              itemCount: 5,
            ),
          ],
        ),
      ),
    );
  }
}
