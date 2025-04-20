part of '../venue_details.dart';
class VenuDetailsTitle extends StatelessWidget {
  const VenuDetailsTitle({
    super.key, required this.name, required this.location,

  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          location,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.accent),
        ),
      ],
    );
  }
}
