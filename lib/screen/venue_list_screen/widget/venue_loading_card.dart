part of '../venu_list.dart';

class VenueLoadingCard extends StatelessWidget {
  const VenueLoadingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ─── Image slider ─────────────────────────────────────────
        AspectRatio(
          aspectRatio: 4 / 3,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15), child: LoadingCard()),
        ),
        SizedBox(
          height: 5,
        ),
        // ─── Text block ────────────────────────────────────────────
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Venue name: uses titleLarge (20sp, w600)
            LoadingCard(
              width: 100,
            ),
            const SizedBox(height: 4),
            // Location subtitle: uses titleMedium (14sp, w400)
            LoadingCard()
          ],
        ),
      ],
    );
  }
}
