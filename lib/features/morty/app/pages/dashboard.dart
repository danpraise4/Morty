import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:morty/core/extension/numbers_extensions.dart';
import 'package:morty/core/resources/colors.dart';
import 'package:morty/core/widgets/app_empty_list.dart';
import 'package:morty/core/widgets/app_loading_view.dart';
import 'package:morty/core/widgets/app_search_bar.dart';
import 'package:morty/features/morty/app/bloc/app_bloc.dart';
import 'package:morty/features/morty/app/controller/app.controller.dart';
import 'package:morty/features/morty/app/widgets/single_character.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const String route = "/dashboard";

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late AppController controller;

  @override
  initState() {
    super.initState();
    controller = AppController();
    controller.appBloc.add(const GetMovieCharactersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.background,
        appBar: KSearchAppBar(
          title: 'Morty',
          onClear: () {
            searchFilter.clear();
            controller.appBloc.add(const GetMovieCharactersEvent());
          },
          onFilterApply: (p0) {
            controller.appBloc.add(GetMovieCharactersEvent.fromMap({...p0}));
          },
          onSearch: (p0) {
            controller.appBloc.add(GetMovieCharactersEvent(name: p0));
          },
        ),
        body: BlocBuilder(
            bloc: controller.appBloc,
            builder: (_, state) {
              return Container(
                padding: 10.insets,
                child: Column(
                  children: [
                    if (state is GetMovieCharaterStateLoading)
                      const LoadingView()
                    else if (state is GetMovieCharatersStateError)
                      AppEmptyList(
                        title: 'Error',
                        subTitle: state.failure.message,
                      )
                    else if (state is GetMovieCharatersStateLoaded)
                      if (state.character.data.isEmpty)
                        const AppEmptyList()
                      else
                        Expanded(
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              mainAxisExtent: 270,
                            ),
                            itemCount: state.character.data.length,
                            itemBuilder: (_, index) {
                              final charater = state.character.data[index];
                              return SingleCharacter(character: charater);
                            },
                          ),
                        )
                  ],
                ),
              );
            }));
  }
}
