part of "venue_details.dart";

class VenueDetailsScreen extends StatefulWidget {
  const VenueDetailsScreen({super.key, required this.venue});
  final Item? venue;

  @override
  State<VenueDetailsScreen> createState() => _VenueDetailsScreenState();
}

class _VenueDetailsScreenState extends State<VenueDetailsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VenueDetailsPageView(
              imageUrls: widget.venue?.images
                      .map(
                        (e) => e.url,
                      )
                      .toList() ??
                  [],
              pageController: _pageController,
              currentPage: _currentPage,
              onPageChanged: (idx) => setState(() => _currentPage = idx),
              closeFunction: () {
                Navigator.of(context).pop();
              },
            ),
            SizedBox(
              height: 15,
            ),
            VenuDetailsTitle(
              name: widget.venue?.name ?? "",
              location: widget.venue?.city ?? "",
            ),
            SizedBox(
              height: 10,
            ),
            VenueDetailsWidget(
              openingHoures: (widget.venue?.openingHours.isEmpty ?? true)
                  ? "Full"
                  : "prpcess it ",
              overviewText: widget.venue?.overviewText ?? [],
            ),
            SizedBox(
              height: 8,
            ),
            ListView.builder(
              itemCount: widget.venue?.thingsToDo.length ?? 0,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final thingToDo =
                    widget.venue?.thingsToDo.elementAtOrNull(index);
                return Column(
                  children: [
                    CustomExpansionTile(
                        title: thingToDo?.title ?? "",
                        badge: thingToDo?.badge ?? "",
                        subtitle: thingToDo?.subtitle ?? "",
                        children: (thingToDo?.items?.isNotEmpty ?? false)
                            ? [
                                VenueItemsDetailsGrid(items: thingToDo?.items),
                              ]
                            : List.generate(
                                thingToDo?.content?.length ?? 0,
                                (index) {
                                  final thingsToDoItem = thingToDo?.content
                                      ?.elementAtOrNull(index)
                                      ?.firstOrNull;
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text("•"),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Flexible(
                                        child: Text(
                                          thingsToDoItem?.text ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )),
                  ],
                );
              },
            )
          ],
        ),
      )),
    );
  }
}

class VenueItemsDetailsGrid extends StatelessWidget {
  const VenueItemsDetailsGrid({
    super.key,
    required this.items,
  });

  final List<ThingsToDoItem>? items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
            childAspectRatio: 1.2),
        itemCount: items?.length ?? 0,
        itemBuilder: (context, index) {
          final item = items?.elementAtOrNull(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Image slider ─────────────────────────────────────────
              AspectRatio(
                aspectRatio: 1.8,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GeneralNetworkImage(
                      url: item?.image?.url ?? "",
                      boxFit: BoxFit.cover,
                      width: double.infinity,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                item?.title ?? "",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          );
          // return VenueCard(
          //   name: venue?.name ?? "",
          //   location: venue?.city ?? "",
          //   imageUrls: venueImagesUrls ?? [],
          //   onCardTap: () {
          //     Navigator.of(context)
          //         .push(MaterialPageRoute(
          //       builder: (context) {
          //         return VenueDetailsScreen(
          //             venue: venue);
          //       },
          //     ));
          //   },
          // );
        });
  }
}
