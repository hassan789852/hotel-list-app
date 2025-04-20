part of '../venue_details.dart';

class CustomExpansionTile extends StatelessWidget {
  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
    required this.badge,
  });
  final String title;
  final String badge;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ExpansionTile(
              childrenPadding: const EdgeInsets.all(0),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.w400)),
                  badge.isNotEmpty
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                              color: AppColors.border,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            badge,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: AppColors.accent,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                          ),
                        )
                      : SizedBox()
                ],
              ),
              // trailing: const Icon(
              //   Icons.keyboard_arrow_down,
              //   size: 20,
              //   color: AppColors.accent,
              // ),

              collapsedIconColor: AppColors.lightGray,
              iconColor: AppColors.lightGray,
              tilePadding: const EdgeInsets.all(0),
              collapsedBackgroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              expandedAlignment: Alignment.centerLeft,
              dense: true,
              visualDensity: const VisualDensity(vertical: -2, horizontal: -2),
              children: children),
          Divider()
        ],
      ),
    );
  }
}
