import 'package:dio_mvvm/app/widgets/app_bar.dart';
import 'package:dio_mvvm/app/widgets/loading_screen.dart';
import 'package:dio_mvvm/ui/home/home_vm.dart';
import 'package:dio_mvvm/data/core/view_state.dart';
import 'package:dio_mvvm/ui/home/product_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  static const route = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (viewModel) {
          viewModel.loadData();
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: const MyAppBar(title: 'Detail'),
            body: _body(context, viewModel),
          );
        });
  }
}

Widget _body(BuildContext context, HomeViewModel viewModel) {
  switch (viewModel.viewState.state) {
    case ResponseState.EMPTY:
      return Text('Empty');
    case ResponseState.LOADING:
      return const LoadingScreen();
    case ResponseState.COMPLETE:
      final items = viewModel.viewState.data ?? List.empty();
      return Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: ((context, index) {
              if (index >= items.length) {
                if (index >= items.length) {
                  if (!viewModel.busy(episodesBusyKey)) {
                    viewModel.loadMoreEpisodes();
                  }
                  return Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 32, bottom: 32),
                      child: const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }
              }
              return Text(items[index].name ?? '');
            }),
          ));
    case ResponseState.ERROR:
      return Text('Error');
  }
}
