// import 'package:flutter/material.dart';

// class MyDropdownButton extends StatefulWidget {
//   @override
//   _MyDropdownButtonState createState() => _MyDropdownButtonState();
// }

// class _MyDropdownButtonState extends State<MyDropdownButton> {
//   List<String> _selectedItems = [];
//   List<String> _items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       decoration: InputDecoration(
//         labelText: 'Select items',
//         border: OutlineInputBorder(),
//       ),
//       items: _items.map((item) {
//         return DropdownMenuItem<String>(
//           value: item,
//           child: Text(item),
//         );
//       }).toList(),
//       onChanged: (value) {
//         setState(() {
//           if (_selectedItems.contains(value)) {
//             _selectedItems.remove(value);
//           } else {
//             _selectedItems.add(value!);
//           }
//         });
//       },
//       selectedItemBuilder: (BuildContext context) {
//         return _selectedItems.map((item) {
//           return ListTile(
//             title: Text(item),
//             trailing: IconButton(
//               icon: Icon(Icons.clear),
//               onPressed: () {
//                 setState(() {
//                   _selectedItems.remove(item);
//                 });
//               },
//             ),
//           );
//         }).toList();
//       },
//       onSaved: (value) {
//         print(value);
//       },
//       validator: (value) {
//         if (_selectedItems.isEmpty) {
//           return 'Please select at least one item';
//         }
//         return null;
//       },
//       isExpanded: true,
//     );
//   }
// }

// ignore_for_file: prefer_final_fields, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

// class MyCheckboxList extends StatefulWidget {
//   @override
//   _MyCheckboxListState createState() => _MyCheckboxListState();
// }

// class _MyCheckboxListState extends State<MyCheckboxList> {
//   List<String> _selectedItems = [];

//   List<String> _items = [
//     'Item 1',
//     'Item 2',
//     'Item 3',
//     'Item 4',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: _items.length,
//       itemBuilder: (BuildContext context, int index) {
//         final item = _items[index];
//         return CheckboxListTile(
//           title: Text(item),
//           value: _selectedItems.contains(item),
//           onChanged: (value) {
//             setState(() {
//               if (value!) {
//                 _selectedItems.add(item);
//               } else {
//                 _selectedItems.remove(item);
//               }
//             });
//           },
//           controlAffinity: ListTileControlAffinity.leading,
//         );
//       },
//     );
//   }
// }
class MyDropdownList extends StatefulWidget {
  @override
  _MyDropdownListState createState() => _MyDropdownListState();
}

class _MyDropdownListState extends State<MyDropdownList> {
  String? _selectedItem;
  List<String> _selectedItems = [];

  List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Select an item',
        border: OutlineInputBorder(),
      ),
      value: _selectedItem,
      items: _items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: CheckboxListTile(
            title: Text(item),
            value: _selectedItems.contains(item),
            onChanged: (value) {
              setState(() {
                if (value!) {
                  _selectedItems.add(item);
                } else {
                  _selectedItems.remove(item);
                }
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedItem = value;
        });
      },
      validator: (value) {
        if (_selectedItems.isEmpty) {
          return 'Please select at least one item';
        }
        return null;
      },
      isExpanded: true,
    );
  }
}
