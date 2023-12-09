import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../services/providers.dart';
import 'package:bucketlist/utils/widgets/statuscard.dart';
import 'package:shimmer/shimmer.dart';
import '../../resources/colors.dart';

class UpdatesList extends ConsumerWidget {
  const UpdatesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updates = ref.watch(statusupdatesProvider);

    return updates.when(
        data: (data) => ListView.builder(
              itemCount: data.Updates.length,
              itemBuilder: (context, index) {
                return StatusCard(
                  content: data.Updates,
                  index: index,
                );
              },
            ),
        error: (e, _) => Text(
              e.toString(),
              style: TextStyle(color: Colors.white),
            ),
        loading: () => loadingShimer());
  }

  Widget loadingShimer() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(children: [
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(30, 30, 30, 1),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.18,
              width: MediaQuery.of(context).size.width * 0.96,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 30,
                          width: 20,
                          child: Shimmer.fromColors(
                              baseColor: const Color.fromARGB(255, 19, 19, 19),
                              highlightColor:
                                  const Color.fromARGB(255, 167, 166, 186),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorsClass.lightblack),
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 19, 19, 19),
                          highlightColor:
                              const Color.fromARGB(255, 167, 166, 186),
                          child: Container(
                            height: 10,
                            width: 40,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(children: [
                    SizedBox(
                        height: 30,
                        width: 20,
                        child: Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 19, 19, 19),
                            highlightColor:
                                const Color.fromARGB(255, 167, 166, 186),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorsClass.lightblack),
                            ))),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 19, 19, 19),
                          highlightColor:
                              const Color.fromARGB(255, 167, 166, 186),
                          child: Container(
                            height: 10,
                            width: 100,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    )
                  ]),
                  Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 20,
                        child: Shimmer.fromColors(
                            baseColor: const Color.fromARGB(255, 19, 19, 19),
                            highlightColor:
                                const Color.fromARGB(255, 167, 166, 186),
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorsClass.lightblack),
                            )),
                      ),
                      const SizedBox(width: 10),
                      Shimmer.fromColors(
                        baseColor: const Color.fromARGB(255, 19, 19, 19),
                        highlightColor:
                            const Color.fromARGB(255, 167, 166, 186),
                        child: Container(
                          height: 10,
                          width: 100,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ]);
        });
  }
}
