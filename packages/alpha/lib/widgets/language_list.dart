import "package:flutter/material.dart";
import "../colors/app_color.dart";
import "../colors/app_theme_context_extension.dart";
import "../model/language.dart";

class VBLanguageList extends StatefulWidget {
  final Function(Language) changeLanguage;
  const VBLanguageList({Key? key, required this.changeLanguage})
      : super(key: key);

  @override
  _VBLanguageListState createState() => _VBLanguageListState();
}

class _VBLanguageListState extends State<VBLanguageList> {
  final List<Language> languageList = Language.languageList();
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Language.languageList().length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(languageList.elementAt(index).languageCode),
          title: Text(
            languageList.elementAt(index).name,
          ),
          trailing: index == _selectedIndex ? const Icon(Icons.check) : null,
          selected: index == _selectedIndex,
          selectedTileColor:
              context.getColor(AppColor.textChatBox).withOpacity(0.1),
          onTap: () => changeLang(index),
        );
      },
    );
  }

  void changeLang(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.changeLanguage(Language.languageList().elementAt(index));
  }

  // int getCurrentLangIndex() async {
  //   Language l = widget.getLanguage();
  //   return Language.languageList()
  //       .indexWhere((element) => element.languageCode == l.languageCode);
  // }
}
