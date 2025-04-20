part of '../venu_list.dart';

class FilterChips extends StatelessWidget {
  FilterChips(
      {super.key, required this.selectedChip, required this.onChipSelected});
  final int selectedChip;
  final void Function(int) onChipSelected;

  final List<String> filters = [
    'Pool & beach',
    'Fitness',
    'Family activities',
    'Dining',
    'Spa'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: AppColors.appBarBackground,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => SizedBox(width: 8),
        itemBuilder: (ctx, i) {
          return ChoiceChip(
            label: Text(filters[i]),
            selected: selectedChip == i,
            // onSelected: (value) {
            //   setState(() {
            //     if (value) {
            //       selectedChip = i;
            //       print(selectedChip);
            //       print(selectedChip == i);
            //     }
            //   });
            // },
            onSelected: (value) {
              onChipSelected(i);
            },
            labelPadding: EdgeInsets.all(0),
            selectedColor: AppColors.accent,
            labelStyle: TextStyle(
              color: selectedChip == i ? Colors.white : AppColors.textPrimary,
            ),
          );
        },
      ),
    );
  }
}
