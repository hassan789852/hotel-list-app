import 'package:flutter/material.dart';
import 'package:hotel_list_app/injection_container.dart';
import 'package:hotel_list_app/model/filter_models.dart';
import 'package:hotel_list_app/screen/venue_list_screen/controller/venue_list_screen_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'venue_list_filter_controller.g.dart';

@Riverpod(keepAlive: true)
class VenueListFilterController extends _$VenueListFilterController {
  @override
  VenueListFilterState build() {
    final asyncValue =
        ref.watch(venueListScreenControllerProvider);
    final filterResponse = asyncValue.venues!.value;
    final fullList = asyncValue.fullItemsList??[];





    // we can use this is if the controller not alive

    // List<String> selectedCategoies=[];
    // for( var filter in filterResponse!.filters){
    //   for(var category in filter.categories){
    //     if((category.selected??false)){
    //       selectedCategoies.add(category.id);
    //     }
    //   }
    // }

    return VenueListFilterState(

        fullResponse: filterResponse,
        categoriesIdsList: [],
        fullList: fullList,
        filteredItems:  filterResponse?.items??[]);
  }






  void onFilterChipTap({

    required filterIndex,
  required categoryIndex}) {
 Category  selectedCategory=  state.fullResponse!.filters.elementAt(filterIndex).categories.elementAt(categoryIndex);
 selectedCategory.selected=!(selectedCategory.selected??false);


 state.fullResponse!.filters.elementAt(filterIndex).categories[categoryIndex]=selectedCategory;

 state=state.copyWith(
     fullResponse: state.fullResponse,
     categoriesIdsList: [],
     filteredItems: []);



 for( var filter in state.fullResponse!.filters){
   for(var category in filter.categories){
     if((category.selected??false)){
       state.categoriesIdsList.add(category.id);
     }
   }
 }

 state=state.copyWith(fullResponse: state.fullResponse,categoriesIdsList: state.categoriesIdsList);

 for(var  categoryIds in state.categoriesIdsList){
   addItemsById(chipId: categoryIds);
 }

 if(state.filteredItems.isEmpty && state.categoriesIdsList.isEmpty){
   state=state.copyWith(filteredItems: state.fullList??[]);
 }





  }



  void addItemsById({required String chipId}) {
    for (Item item in state.fullList ?? []) {
      final List<String> categoriesIds = item.categories
          .map(
            (e) => e.id,
          )
          .toList();

      if (categoriesIds.contains(chipId)) {
        state = state.copyWith(filteredItems: [...state.filteredItems, item]);
        debugPrint("$chipId added with ${state.filteredItems.first}");
      }
    }
  }



  void onApplyButtonPressed(BuildContext context) {
    ref.read(sl<AutoDisposeNotifierProviderImpl<VenueListScreenController,VenueListState>>()
            .notifier)
        .applyFilter(filteredItems: state.filteredItems);


    Navigator.pop(context);
  }
}

class VenueListFilterState {

  final List<String> categoriesIdsList;
  final List<Item> filteredItems;

  final FilterResponse? fullResponse;
  final List<Item> fullList;

  VenueListFilterState(
      {
      required this.categoriesIdsList,
      required this.fullList,
      required this.fullResponse,
      required this.filteredItems});

  VenueListFilterState copyWith({
    FilterResponse? filterResponse,
    FilterResponse? fullResponse,
    List<String>? categoriesIdsList,
    List<Item>? filteredItems,
    List<Item>? fullList,
  }) {
    return VenueListFilterState(

      fullList: fullList ?? this.fullList,
      fullResponse: fullResponse ?? this.fullResponse,
      categoriesIdsList: categoriesIdsList ?? this.categoriesIdsList,
      filteredItems: filteredItems ?? this.filteredItems,
    );
  }
}
