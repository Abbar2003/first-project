import 'package:admin2/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GetDialog extends StatelessWidget {
  const GetDialog({super.key, required this.text, required this.path});
  final String text;
  final String path;
  @override
  Widget build(BuildContext context) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.blue),
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color:const Color(0xff6EC17D),
                          ),borderRadius:const BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 10),
                             Image(
                              image: AssetImage(path),
                              height: 80,
                              width: 80,
                            ),
                            const SizedBox(height: 15),
                             Text(
                              text,
                              style:const TextStyle(
                                color: Colors.black,
                                  fontWeight: FontWeight.bold, fontSize: 30),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            //Buttons
                            const SizedBox(width: 10),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                alignment: Alignment.center,
                                foregroundColor: const Color(0xFFFFFFFF),
                                backgroundColor:const Color(0xff6EC17D),
                                minimumSize: const Size(55, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                Get.offAll(() => HomePage());
                            
                              },
                              child: Text(
                                'OK',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
  }
}