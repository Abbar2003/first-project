import 'package:admin2/components/basic%20components/custom_dialog.dart';
import 'package:admin2/constants.dart';
import 'package:admin2/controller/practical_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowPracticalSubject extends StatelessWidget {
  ShowPracticalSubject({super.key});
  final practicalController = Get.put(PracticalController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: practicalController.getPractical(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const Text(
                      'Practical Subject',
                      style: TextStyle(
                          color: Color(0xff6EC17D),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                      itemCount: snapshot.data['data'].length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 25),
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => MyDialog(
                                    controller: practicalController,
                                    mem: 'teacher',
                                    subjectId:
                                        practicalController.decodedRes['data']
                                            [index]['subject_id']));
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height / 9,
                            width: MediaQuery.of(context).size.width / 9,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: kPrimaryColor, width: 3),
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage('assets/images/design.png'),
                                  height: 75,
                                  width: 75,
                                ),
                                const Text(
                                  'Subject name :',
                                  style: TextStyle(
                                      color: Color(0xff6EC17D), fontSize: 25),
                                ),
                                Text(
                                  '${snapshot.data['data'][index]['name_subject']}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: Text('loading...'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
