import 'package:flutter/material.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:morty/core/widgets/app_search_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const String route = "/dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: KSearchAppBar(
        title: 'Morty',
        onClear: () {},
        onFilterApply: (p0) {},
        onSearch: (p0) {},
      ),
      body: Container(),
    );
  }
}
