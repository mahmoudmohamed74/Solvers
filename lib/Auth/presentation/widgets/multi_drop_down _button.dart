import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:solvers/core/global/resources/color_manager.dart';
import 'package:solvers/core/global/resources/values_manger.dart';

class MultiDropDownButtonWidget extends StatefulWidget {
  const MultiDropDownButtonWidget({Key? key}) : super(key: key);

  @override
  State<MultiDropDownButtonWidget> createState() =>
      _MultiDropDownButtonWidgetState();
}

class _MultiDropDownButtonWidgetState extends State<MultiDropDownButtonWidget> {
  final List<String> items = [
    'Using New Application',
    'Java programming',
    'Backup',
    'Network',
    'Flutter',
    'Dart',
  ];
  List<String> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        hint: Align(
          alignment: AlignmentDirectional.center,
          child: Text(
            'Main problem',
            style: TextStyle(
              fontSize: AppSize.s16,
              color: ColorManager.black,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            //disable default onTap to avoid closing menu when selecting an item
            enabled: false,
            child: StatefulBuilder(
              builder: (context, menuSetState) {
                final _isSelected = selectedItems.contains(item);
                return InkWell(
                  onTap: () {
                    _isSelected
                        ? selectedItems.remove(item)
                        : selectedItems.add(item);
                    //This rebuilds the StatefulWidget to update the button's text
                    setState(() {});
                    //This rebuilds the dropdownMenu Widget to update the check mark
                    menuSetState(() {});
                  },
                  child: Container(
                    height: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.s14),
                    child: Row(
                      children: [
                        _isSelected
                            ? const Icon(Icons.check_box_outlined)
                            : const Icon(Icons.check_box_outline_blank),
                        const SizedBox(width: AppSize.s16),
                        Text(
                          item,
                          style: TextStyle(
                            fontSize: AppSize.s16,
                            color: ColorManager.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
        //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
        value: selectedItems.isEmpty ? null : selectedItems.last,
        onChanged: (value) {},
        selectedItemBuilder: (context) {
          return items.map(
            (item) {
              return Container(
                width: AppSize.s200,
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.all(0),
                child: Text(
                  selectedItems.join(', '),
                  style: TextStyle(
                    fontSize: AppSize.s16,
                    color: ColorManager.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            },
          ).toList();
        },
        buttonStyleData: ButtonStyleData(
          height: AppSize.s50,
          width: AppSize.s250,
          padding: const EdgeInsets.only(left: AppSize.s14, right: AppSize.s14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s10),
            border: Border.all(
              color: ColorManager.purple,
            ),
            color: ColorManager.white,
          ),
          elevation: 0,
        ),
        iconStyleData: IconStyleData(
          icon: CircleAvatar(
            radius: AppSize.s10,
            backgroundColor: ColorManager.primary,
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              size: AppSize.s20,
              color: ColorManager.black,
            ),
          ),
          iconSize: AppSize.s20,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.black,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: AppSize.s200,
          width: AppSize.s250,
          padding: const EdgeInsets.all(AppSize.s0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s10),
            color: ColorManager.white,
          ),
          elevation: 0,
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(AppSize.s40),
            thickness: MaterialStateProperty.all(AppSize.s6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: AppSize.s40,
          padding: EdgeInsets.all(AppSize.s0),
        ),
      ),
    );
  }
}
