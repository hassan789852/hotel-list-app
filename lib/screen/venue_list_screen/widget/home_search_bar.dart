part of '../venu_list.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: AppColors.lightGray.withOpacity(.3),
                    blurRadius: 3,
                    offset: Offset(0, 2))
              ]),
          child: CustomTextFormField(
            margin: EdgeInsets.all(0),
            filled: true,
            fillColor: AppColors.white,
            borderStyleType: BorderStyleType.outlineInput,
            borderRadius: BorderRadius.circular(10),
            borderEnabledColor: AppColors.transparent,
            hintText: "Search for venue",
            prefixIcon: Icon(Icons.search, color: AppColors.textSecondary),
            hintStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.textSecondary),
          ),
        ));
  }
}
