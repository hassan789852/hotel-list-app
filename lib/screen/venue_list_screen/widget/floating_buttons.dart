part of '../venu_list.dart';

class FloatingButtons extends StatelessWidget {
  const FloatingButtons({super.key, this.openFilterBottomSheet,this.onMapButtonPress});
  final void Function()? openFilterBottomSheet;
  final void Function()? onMapButtonPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(25)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: onMapButtonPress,
                  child: Row(
                    children: [
                      GeneralImageAssets(
                        path: Res.mapIcon,
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Map")
                    ],
                  ),
                ),
              ),
              Container(
                height: 43,
                width: 1,
                color: AppColors.accent,
                margin: EdgeInsets.symmetric(horizontal: 15),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: InkWell(
                  onTap: openFilterBottomSheet,
                  child: Row(
                    children: [
                      GeneralImageAssets(
                        path: Res.filterIcon,
                        width: 18,
                        height: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Filter")
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.main,
            foregroundColor: Colors.white,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
          ),
          child: Text(
            'Join Privillee today!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
