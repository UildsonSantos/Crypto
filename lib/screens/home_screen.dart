import 'package:crypto/controllers/controllers.dart';
import 'package:crypto/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff494F55),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crypto Market',
                  style: textStyle(
                    size: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Obx(
                  () => controller.isLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.coinsState.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 60,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[700],
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey[700]!,
                                                    offset: const Offset(4, 4),
                                                    blurRadius: 5)
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              controller
                                                  .coinsState[index].image,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            Text(
                                              controller.coinsState[index].name,
                                              style: textStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${controller.coinsState[index].priceChangePercentage24H.toStringAsFixed(2)}%',
                                              style: textStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const SizedBox(height: 10),
                                        Text(
                                          '\$ ${controller.coinsState[index].currentPrice}',
                                          style: textStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          controller.coinsState[index].symbol
                                              .toUpperCase(),
                                          style: textStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
