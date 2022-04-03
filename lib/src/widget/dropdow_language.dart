import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mission_timer/core/config/language/localization_service.dart';
import 'package:mission_timer/src/widget/calendar/calendar_controller.dart';

class DropDownLanguage extends StatelessWidget {
  const DropDownLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DropDownLanguageController>(
        init: DropDownLanguageController(),
        id: '/dropDown_language_change',
        builder: (controller) {
          return DropdownButton<String>(
            isExpanded: false,
            icon: Icon(Icons.arrow_drop_down),
            value: controller.selectedLang,
            items: _buildDropdownMenuItems(),
            onChanged: (String? value) {
              controller.changeLanguage(value!);
              LocalizationService.changeLocale(value);
            },
          );
        });
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    List<DropdownMenuItem<String>> list = [];
    LocalizationService.langs.forEach((key, value) {
      list.add(DropdownMenuItem<String>(
        value: key,
        child: Text(key),
      ));
    });
    return list;
  }
}

class DropDownLanguageController extends GetxController {
  String selectedLang = LocalizationService.locale.languageCode;
  void changeLanguage(String value) {
    selectedLang = value;
    LocalizationService.changeLocale(value);
    update(['dropDown_language_change']);
  }
}
