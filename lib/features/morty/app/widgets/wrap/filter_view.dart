import 'package:flutter/material.dart';
import 'package:morty/core/extension/string_extensions.dart';
import 'package:morty/core/resources/constants.dart';
import 'package:morty/features/morty/app/controller/app.controller.dart';
import 'package:morty/features/morty/data/constants/constants.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key, required this.onChangeDetected});
  final Function() onChangeDetected;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: contentUI(),
    );
  }

  Widget contentUI() {
    return Column(
      children: [
        singleFilter(
            title: "Status",
            options: statusTypes,
            onTap: (x) {
              searchFilter['status'] = x;
              widget.onChangeDetected.call();
            }),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        singleFilter(
            title: "Gender",
            options: genderTypes,
            onTap: (x) {
              searchFilter['gender'] = x;
              widget.onChangeDetected.call();
            }),
      ],
    );
  }

  Widget singleFilter(
      {required List<String> options,
      required String title,
      required Function(String) onTap}) {
    return Column(
      children: [
        Text(title.capitalizeEach),
        h10,
        ...options.map((x) {
          return GestureDetector(
            onTap: (){
              onTap(x);
            },
            child: Row(
              children: [
                Checkbox.adaptive(value: searchFilter[title] == x, onChanged: (x){}),
                Text(x)
              ],
            ),
          );
        })
      ],
    );
  }
}
