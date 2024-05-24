import 'package:alarm_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  final bool isOn;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({super.key, required this.isOn, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isOn);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isOn ? AppColors.green : AppColors.grey,
        ),
        child: Stack(
          children: <Widget>[
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              top: 3.0,
              right: isOn ? 30.0 : 0.0,
              left: isOn ? 0.0 : 30.0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Center(
                  child: Container(
                    height: 23,
                    width: 23,
                    decoration: BoxDecoration(shape: BoxShape.circle,color:isOn ? Colors.white : const Color(0xff6c6e7b)),
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
