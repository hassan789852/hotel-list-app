part of 'venu_list.dart';

class VenueListScreen extends ConsumerStatefulWidget {
  const VenueListScreen({super.key});

  @override
  VenueListScreenState createState() => VenueListScreenState();
}

class VenueListScreenState extends ConsumerState<VenueListScreen> {
  //Cache the notifier in a field instead of re‑reading `ref` everywhere
  late final VenueListScreenController _controller;

  @override
  void initState() {
    super.initState();
    //  Read the controller ONCE, while the widget is still mounted
    _controller = ref.read(venueListScreenControllerProvider.notifier);
    //  Hook up your scroll listener and kick off the initial load
    _controller.showFloatingActionButtonsListener();
    Future(() => _controller.getVenuesByChoiceChip(index: 0));
  }

  @override
  void dispose() {
    //  Clean up using the saved controller—no more `ref.read(...)` here!
    _controller.removerListenerForShowFloatingActionButton();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final venueListScreenState = ref.watch(venueListScreenControllerProvider);
    final venueListScreenNotifier =
        ref.read(venueListScreenControllerProvider.notifier);
    return Scaffold(
      appBar: VenuListScreenAppbar(),
      body: Column(
        children: [
          FilterChips(
            selectedChip: venueListScreenState.selectedChip,
            onChipSelected:
                ref.read(venueListScreenControllerProvider.notifier).changeChip,
          ),
          const SizedBox(height: 8),
          const HomeSearchBar(),
          (venueListScreenState.venues?.isLoading ?? false)
              ? VenuesListLoadingShimmer()
              : Expanded(
                  child: GridView.builder(
                      controller: venueListScreenState
                          .gridController, // attach controller
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                              mainAxisExtent: 210),
                      itemCount:
                          venueListScreenState.venues?.value?.items?.length ?? 0,
                      itemBuilder: (context, index) {
                        Item? venue = venueListScreenState.venues?.value?.items!
                            .elementAt(index);
                        final venueImagesUrls = venue?.images
                            .map(
                              (e) => e.url,
                            )
                            .toList();
                        return VenueCard(
                          name: venue?.name ?? "",
                          location: venue?.city ?? "",
                          imageUrls: venueImagesUrls??[],
                        );
                      }),
                ),
        ],
      ),

      // ─── Floating “Join” button ────────────────────
      floatingActionButton: (venueListScreenState.showFab &
              (!(venueListScreenState.venues?.isLoading ?? false)))
          ? Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: FloatingButtons(
                key: const Key('filter_sheet_button'),
                openFilterBottomSheet: () {
                  final fullList = venueListScreenState.fullItemsList ?? [];
                  final fullResponse = venueListScreenState.venues?.value ;
                  VenueListScreenFilter.builder(
                    context:  context,
                    fullList:  fullList,
                    fullResponse:fullResponse,

                    onApplyFilterPressed: () {
                      // final venueListFilterState = ref.watch(sl<
                      //     NotifierProviderImpl<VenueListFilterController,
                      //         VenueListFilterState>>());
                      // venueListScreenNotifier.applyFilter(
                      //     filteredItems: venueListFilterState.filteredItems);
                    },
                  );
                },

                onMapButtonPress: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (c) => MapPage(
                          places:
                          venueListScreenState.venues?.value?.items??[]),
                    ),
                  );
                },
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
