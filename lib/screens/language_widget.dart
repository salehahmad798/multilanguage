import 'package:flutter/material.dart';
import 'package:getx_multilanguage/controllers/language_controller.dart';
import 'package:getx_multilanguage/models/language_model.dart';
import 'package:getx_multilanguage/utils/app_constants.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationControler localizationControler;
  final int index;
  LanguageWidget(
      {required this.index,
      required this.languageModel,
      required this.localizationControler});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {


          localizationControler.setLanguage(Locale(AppConstants.languages[index].languageCode,
          
          AppConstants.languages[index].countryCode
          ),
          
          
          );
          localizationControler.setSelectIndex(index);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[200]!, blurRadius: 5, spreadRadius: 1)
              ]),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 5),
                    Text(languageModel.languageName)
                  ],
                ),
              ),
              localizationControler.selectedIndex == index
                  ? Positioned(
                      child: Icon(
                      Icons.check_circle,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ))
                  : SizedBox()
            ],
          ),
        ));
  }
}
