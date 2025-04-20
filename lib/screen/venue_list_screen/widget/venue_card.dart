part of '../venu_list.dart';



/// A card that shows a swipeable image slider and the venue’s name & location.
/// Text styles use the new (non‑deprecated) textTheme properties.
class VenueCard extends StatefulWidget {
  final String name;
  final String location;
  final List<String?> imageUrls;
  const VenueCard({super.key,    required this.name,
    required this.location,
    required this.imageUrls,});

  @override
  _VenueCardState createState() => _VenueCardState();
}

class _VenueCardState extends State<VenueCard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ─── Image slider ─────────────────────────────────────────
        AspectRatio(
          aspectRatio: 4 / 3,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.imageUrls.length,
                  onPageChanged: (idx) => setState(() => _currentPage = idx),
                  itemBuilder: (context, idx) => GeneralNetworkImage(
                    url: widget.imageUrls[idx]??"",
                    boxFit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              // dot indicators
              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.imageUrls.length,
                    (idx) => Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == idx
                            ? AppColors.white
                            : AppColors.white.withOpacity(.5),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        // ─── Text block ────────────────────────────────────────────
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Venue name: uses titleLarge (20sp, w600)
            Text(
              widget.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 4),
            // Location subtitle: uses titleMedium (14sp, w400)
            Text(
              widget.location,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.accent),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
