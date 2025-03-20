import 'package:flutter/cupertino.dart';
import 'package:nucles_app/config/config.dart';

class PrimarySwitch extends StatelessWidget {
  const PrimarySwitch({
    super.key,
    required this.value,
    this.onChanged,
  });

  final Function(bool?)? onChanged;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      height: 15,
      child: CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: AppColors.getColor(ColorKey.primary60),
      ),
    );
  }
}
