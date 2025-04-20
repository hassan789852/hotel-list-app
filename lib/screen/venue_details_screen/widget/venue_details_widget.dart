part of '../venue_details.dart';
class VenueDetailsWidget extends StatelessWidget {
  const VenueDetailsWidget({
    super.key,
    required this.openingHoures,
    required this.overviewText,
  });
  final String openingHoures;
  final List<OverviewText> overviewText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Opening hours",
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.accent),
          ),
          SizedBox(
            height: 4,
          ),
          Text(openingHoures.isEmpty ? "Full" : openingHoures,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400)),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemCount: overviewText.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final text = overviewText.elementAtOrNull(index)?.text;
              return Text(text ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w400, ));
            },
          )
        ],
      ),
    );
  }
}
