part of '../venue_details.dart';

class VenueDetailsPageView extends StatelessWidget {
  final List<String?> imageUrls;
  final PageController pageController;
  final int currentPage;
  final ValueChanged<int> onPageChanged;
  final void Function()? closeFunction;

  const VenueDetailsPageView({
    super.key,
    required this.imageUrls,
    required this.pageController,
    required this.currentPage,
    required this.onPageChanged,
    this.closeFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.9,
      child: Stack(
        children: [
          PageView.builder(
            itemCount: imageUrls.length,
            controller: pageController,
            onPageChanged: onPageChanged,
            itemBuilder: (context, idx) => GeneralNetworkImage(
              url: imageUrls[idx] ?? "",
              boxFit: BoxFit.cover,
              width: double.infinity,
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
                imageUrls.length,
                (idx) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == idx
                        ? AppColors.white
                        : AppColors.white.withOpacity(.5),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 20,
              right: 20,
              child: InkWell(
                onTap: closeFunction,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(.8),
                      shape: BoxShape.circle),
                  child: Icon(Icons.close),
                ),
              ))
        ],
      ),
    );
  }
}
