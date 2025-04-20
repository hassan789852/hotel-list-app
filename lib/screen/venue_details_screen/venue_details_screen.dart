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
                        children: []),
              
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
