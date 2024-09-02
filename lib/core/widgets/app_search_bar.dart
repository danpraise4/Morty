// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:morty/core/resources/strings.dart';
import 'package:morty/features/introduction/app/pages/splash.dart';

class KSearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final ValueChanged<String>? onSearch;
  final ValueChanged<Map<String, dynamic>>? onFilterApply;
  final VoidCallback? onClear;

  const KSearchAppBar({
    super.key,
    required this.title,
    this.onSearch,
    this.onFilterApply,
    this.onClear,
  });

  @override
  _KSearchAppBarState createState() => _KSearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class _KSearchAppBarState extends State<KSearchAppBar> {
  bool _isSearching = false;
  FocusNode? focusNode;

  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primary,
      titleTextStyle: TextStyle(color: Palette.white, fontSize: 20.sp),
      title: _isSearching ? _buildSearchField() : Text(widget.title),
      actions: _buildActions(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      focusNode: focusNode,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      decoration: InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        hintStyle: TextStyle(
          color: Palette.white,
        ),
      ),
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) {
        if (widget.onSearch != null) {
          widget.onSearch!(query);
        }
      },
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: Icon(
            Icons.filter_list,
            color: Palette.white,
          ),
          onPressed: _showFilterDialog,
        ),
        IconButton(
          icon: Icon(
            Icons.close,
            color: Palette.white,
          ),
          onPressed: () {
            setState(() {
              _isSearching = false;
              _searchController.clear();
            });
            if (widget.onClear != null) {
              widget.onClear!();
            }
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: SvgPicture.asset(
          '$svgPath/icon_search.svg',
          color: Palette.white,
        ),
        onPressed: () {
          setState(() {
            _isSearching = true;
          });
        },
      ),
    ];
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Filter Options'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Example filters, you can customize these fields
              TextField(
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Gender'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Apply'),
              onPressed: () {
                // Example filter data
                Map<String, dynamic> filters = {
                  'age': 25, // replace with actual input value
                  'gender': 'Male', // replace with actual input value
                };
                if (widget.onFilterApply != null) {
                  widget.onFilterApply!(filters);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
