import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/screen/venue_list_screen_filter/controller/venue_list_filter_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../injection_container.dart';
import '../../venue_list_screen_filter/venue_list_filter.dart';
part 'venue_list_screen_controller.g.dart';

@riverpod
class VenueListScreenController extends _$VenueListScreenController {
  @override
  VenueListScreenState build() {
    return VenueListScreenState(gridController: ScrollController(),selectedCategoies:[]);
  }

  void changeChip(int index) {
    state = state.copyWith(selectedChip: index);
    getVenuesByChoiceChip(index: index);
  }









  Future<void> getVenuesByChoiceChip({required int index}) async {
    if (!(index == 0 || index == 1)) {
      return;
    }
    state = state.copyWith(venues: AsyncValue.loading());
    await Future.delayed(
      Duration(seconds: 3),
      () {
        debugPrint("Loading stopped");
      },
    );

    String? jsonString;

    if (index == 0) {
      jsonString = await rootBundle.loadString('assets/json/hotels.json');
    } else if (index == 1) {
      jsonString = await rootBundle.loadString('assets/json/gyms.json');
    }
    final Map<String, dynamic> data = jsonDecode(jsonString ?? "{}");
    final response = FilterResponse.fromJson(data);
    state = state.copyWith(
        venues: AsyncValue.data(response), fullItemsList: response.items);
  }

  void _onGridScroll() {
    // ScrollDirection comes from ScrollPosition.userScrollDirection
    final direction = state.gridController.position.userScrollDirection;
    if (direction == ScrollDirection.reverse && state.showFab) {
      state = state.copyWith(showFab: false);
    } else if (direction == ScrollDirection.forward && !state.showFab) {
      state = state.copyWith(showFab: true);
    }
  }



  //add listener
  void showFloatingActionButtonsListener() {
    state.gridController.addListener(_onGridScroll);
  }

  //remove linstener
  void removerListenerForShowFloatingActionButton() {
    state.gridController
      ..removeListener(_onGridScroll)
      ..dispose();
  }

  void applyFilter({required List<Item> filteredItems}) {




    state = state.copyWith(
        venues: AsyncValue.data(FilterResponse(
            filters: state.venues?.value?.filters ?? [], items: filteredItems))


    );
  }



  // ------Load More -------------------------------------
  Future<void> loadNextPage() async {
    if (state.isFetchingMore??false) return;

    state = state.copyWith(isFetchingMore: true);

    await Future.delayed(Duration(seconds: 1)); // simulate latency

    final allItems = state.fullItemsList ?? [];
    final nextPageStart = state.currentPage * state.pageSize;
    final nextPageItems = allItems.skip(nextPageStart).take(state.pageSize).toList();

    final updatedList = [
      ...?state.venues?.value?.items,
      ...nextPageItems,
    ];

    state = state.copyWith(
      venues: AsyncValue.data(
        FilterResponse(
          filters: state.venues?.value?.filters ?? [],
          items: updatedList,
        ),
      ),
      currentPage: state.currentPage + 1,
      isFetchingMore: false,
    );
  }


  void attachScrollListener(ScrollController controller, VoidCallback onLoadMore) {
    controller.addListener(() {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent - 200) {
        onLoadMore();
      }
    });
  }
}

class VenueListScreenState {
  final int selectedChip;
  final int pageSize;
  final AsyncValue<FilterResponse>? venues;
  final List<Item>? fullItemsList;
  final List<String>? selectedCategoies;
  final bool showFab;
  final bool? isFetchingMore;
  final int currentPage;
  final ScrollController gridController;

  VenueListScreenState(
      {this.selectedChip = 0,
      this.currentPage = 0,
      this.pageSize = 20,
      this.venues,
      this.isFetchingMore,
      this.showFab = true,
      required this.gridController,
      required this.selectedCategoies,
      this.fullItemsList});

  VenueListScreenState copyWith({
    int? selectedChip,
    int? pageSize,
    int? currentPage,
    AsyncValue<FilterResponse>? venues,
    bool? showFab,
    bool? isFetchingMore,
    ScrollController? gridController,
    List<Item>? fullItemsList,
    List<String>? selectedCategoies,
  }) {
    return VenueListScreenState(
        selectedChip: selectedChip ?? this.selectedChip,
        venues: venues ?? this.venues,
        pageSize: pageSize ?? this.pageSize,
        currentPage: currentPage ?? this.currentPage,
        isFetchingMore: isFetchingMore ?? this.isFetchingMore,
        showFab: showFab ?? this.showFab,
        selectedCategoies: selectedCategoies ?? this.selectedCategoies,
        gridController: gridController ?? this.gridController,
        fullItemsList: fullItemsList ?? this.fullItemsList);
  }
}
