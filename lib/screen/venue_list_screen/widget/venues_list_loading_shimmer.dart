part of '../venu_list.dart';

class VenuesListLoadingShimmer extends StatelessWidget {
  const VenuesListLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 10,
              mainAxisExtent: 210),
          itemCount: 6,
          itemBuilder: (ctx, i) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: VenueLoadingCard())),
    );
  }
}
