import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/src/modules/home/home_bloc.dart';
import 'package:test_project/src/table_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int getCrossAxisCount(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      if (MediaQuery.of(context).size.shortestSide < 600) {
        return 4;
      } else {
        return 6;
      }
    } else {
      return 8;
    }
  }

  List<String> sendKeyData(List<TableItem> parsedData) {
    List<String> uniqueKey = [];
    for (var item in parsedData) {
      String? name = item.name;
      if (name != null && !uniqueKey.contains(name)) {
        uniqueKey.add(name);
      }
    }
    return uniqueKey;
  }

  List<TableItem> sendGroupData(String key, List<TableItem> parsedData) {
    List<TableItem> uniqueValue = [];
    for (var item in parsedData) {
      if (item.name == key) {
        uniqueValue.add(item);
      }
    }
    // Sort the uniqueValue list based on sortOrder
    uniqueValue.sort((a, b) => a.sortOrder!.compareTo(b.sortOrder!));

    return uniqueValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadedState) {
            var key = sendKeyData(state.data);
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ListView.builder(
                itemCount: key.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var value = sendGroupData(key[index], state.data);
                  return dataPresentation(keyValue: key[index], item: value);
                },
              ),
            );
          } else if (state is HomeErrorState) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: Text("Something went wrong"),
          );
        },
      ),
    );
  }

  Widget dataPresentation({
    required String keyValue,
    required List<TableItem> item,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(keyValue),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: getCrossAxisCount(context),
          ),
          itemCount: item.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            var data = item[index];
            return Container(
              alignment: Alignment.center,
              height: 20,
              width: 20,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(data.tableName ?? ""),
            );
          },
        ),
      ],
    );
  }
}
