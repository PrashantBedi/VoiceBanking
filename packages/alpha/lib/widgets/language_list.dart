import "package:alpha/widgets/text_widget.dart";
import "package:flutter/material.dart";
import "../colors/app_color.dart";
import "../colors/app_theme_context_extension.dart";
import "../model/language.dart";

class VBLanguageList extends StatefulWidget {
  final Function(Language) changeLanguage;
  final Language language;

  const VBLanguageList(
      {Key? key, required this.changeLanguage, required this.language})
      : super(key: key);

  @override
  _VBLanguageListState createState() => _VBLanguageListState();
}

class _VBLanguageListState extends State<VBLanguageList> {
  final List<Language> languageList = Language.languageList();
  late int _selectedIndex;

  @override
  void initState() {
    _selectedIndex = getCurrentLangIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Language
          .languageList()
          .length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () => changeLang(index),
            child: Card(
              elevation: 5,
              color: index == _selectedIndex ? context.getColor(AppColor.textChatBox) : context.getColor(AppColor.backgroundLight),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8.0, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VBTextWidget.bodyMedium(
                      languageList
                          .elementAt(index)
                          .name,
                    ),
                    index == _selectedIndex
                        ? const Icon(Icons.check,)
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        );
        //   ListTile(
        //   leading: Text(languageList.elementAt(index).languageCode),
        //   title: Text(
        //     languageList.elementAt(index).name,
        //   ),
        //   trailing: index == _selectedIndex ? const Icon(Icons.check) : null,
        //   selected: index == _selectedIndex,
        //   selectedTileColor:
        //       context.getColor(AppColor.textChatBox).withOpacity(0.1),
        //   onTap: () => changeLang(index),
        // );
      },
    );
  }

  void changeLang(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.changeLanguage(Language.languageList().elementAt(index));
  }

  int getCurrentLangIndex() {
    Language l = widget.language;
    return Language.languageList()
        .indexWhere((element) => element.languageCode == l.languageCode);
  }
}
