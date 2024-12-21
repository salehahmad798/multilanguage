import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_multilanguage/controllers/language_controller.dart';
import 'package:getx_multilanguage/screens/language_widget.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<LocalizationControler>(builder: (localizationControler) {
          return Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            "assets/app_images/foodlogo.png",
                            width: 120,
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("select_language".tr,
                              style: TextStyle(fontSize: 18)),
                        ),
                        SizedBox(height: 20),
                        GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1),
                          itemCount: localizationControler.languages.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return LanguageWidget(
                              index: index,
                              languageModel: localizationControler.languages[index],
                              localizationControler: localizationControler,
                            );
                          },
                        ),
                        SizedBox(height: 10),
                        Text("you_can_change_language".tr,
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
