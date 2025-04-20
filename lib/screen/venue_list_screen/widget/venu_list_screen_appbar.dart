part of '../venu_list.dart';

class VenuListScreenAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const VenuListScreenAppbar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize; // default is 56.0

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarBackground,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.appBarBackground,
      ),
      elevation: 0,
      titleSpacing: 10,
      title: GeneralImageAssets(
        path: Res.logoImage,
        width: 120,
        boxFit: BoxFit.contain,
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 15),
        child: GeneralImageAssets(
          path: Res.drawerIcon,
          width: 30,
          height: 30,
          boxFit: BoxFit.contain,
        ),
      ),
      leadingWidth: 45,
      scrolledUnderElevation: 0,
    );
  }
}
