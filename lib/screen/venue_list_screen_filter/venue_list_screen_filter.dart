part of 'venue_list_filter.dart';


class VenueListScreenFilter extends ConsumerWidget {
  const VenueListScreenFilter(
      {
       super.key,
      required this.onApplyFilterPressed,
      required this.fullList,
      required this.fullResponse,
      });

  final void Function()? onApplyFilterPressed;
  final List<Item>fullList ;
  final FilterResponse? fullResponse ;

  static builder({required BuildContext context,
  required  List<Item>fullList,
  required  FilterResponse? fullResponse,
    required void Function()? onApplyFilterPressed,

  }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return VenueListScreenFilter(
            onApplyFilterPressed: onApplyFilterPressed,
            fullList: fullList,
            fullResponse: fullResponse,

          );
        });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final venueListFilterState = ref.watch(sl<
        NotifierProviderImpl<VenueListFilterController,
            VenueListFilterState>>());
    final venueListFilterNotifier = ref.read(sl<
            NotifierProviderImpl<VenueListFilterController,
                VenueListFilterState>>()
        .notifier);
    return Container(
      height: MediaQuery.of(context).size.height ,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              itemCount:
                  venueListFilterState.fullResponse?.filters.length ?? 0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, filtersIndex) {
                final filters = venueListFilterState.fullResponse?.filters
                    .elementAtOrNull(filtersIndex);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(filters?.name ?? ""),
                    SizedBox(
                      height: 10,
                    ),
                    FilterCategoryChips(filter: filters!,filterIndex: filtersIndex,
                        onChipTap: (categoryIndex){
                      venueListFilterNotifier.onFilterChipTap(
                          filterIndex: filtersIndex,categoryIndex: categoryIndex);
                    },),

                    SizedBox(
                      height: 15,
                    )
                  ],
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              // onTap: () {
              //   Navigator.of(context).pop();
              //   venueListFilterNotifier.onApplyButtonPressed();
              // },
              onTap: (){
                venueListFilterNotifier.onApplyButtonPressed(context);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 45,
                decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(30)),
                alignment: Alignment.center,
                child: Text(
                    "Show ${venueListFilterState.filteredItems.length} venues",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: AppColors.white)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }


}


/// A stateless widget to render filter group chips using your existing model.
class FilterCategoryChips extends StatelessWidget {
  /// A single filter group with its categories.
  final FilterGroup filter;
  /// Index of this filter in the list, passed back on tap.
  final int filterIndex;
  /// Callback when a chip is tapped: (filterIndex, categoryIndex).
  final void Function(int categoryIndex) onChipTap;

  const FilterCategoryChips({
    Key? key,
    required this.filter,
    required this.filterIndex,
    required this.onChipTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: List.generate(filter.categories.length, (categoryIndex) {
        final category = filter.categories[categoryIndex];
        return ChoiceChip(
          label: Text(category.name),
          selected: category.selected??false,
          onSelected: (value) {
            onChipTap(categoryIndex);
          },
          checkmarkColor: Colors.white,
          showCheckmark: false,
          selectedColor: AppColors.main,
          labelPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          padding: EdgeInsets.zero,
          labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: (category.selected??false) ? AppColors.white : AppColors.textPrimary,
          ),
        );
      }),
    );
  }
}

