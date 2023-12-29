import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../table_modal.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is FetchDataEvent) {
        emit(HomeLoadingState());
        try {
          final data = await loadData();
          if (data.isEmpty) {
            print("data $loadAssetData");
            emit(HomeLoadingState());
          } else {
            print("data $loadAssetData");
            emit(HomeLoadedState(data));
          }
        } catch (e) {
          emit(HomeErrorState(e.toString()));
        }
      }
    });
  }

  Future<String> loadAssetData() async {
    return await rootBundle.loadString('assets/row_data.json');
  }

  Future<List<TableItem>> loadData() async {
    String data = await rootBundle.loadString('assets/row_data.json');
    List<dynamic> parsed = jsonDecode(data);
    print("1111111${data}");
    List<TableItem> tableData = [];
    try {
      for (var element in parsed) {
        try {
          tableData.add(TableItem.fromJson(element));
        } catch (e) {}
      }
    } catch (e) {
      print("catch $e");
    }

    return tableData;
  }
}
