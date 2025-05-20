import 'package:flutter/material.dart';
import 'package:yummy_app/core/resources/constants.dart';

class PopMenuButton extends StatelessWidget {
  const PopMenuButton({
    super.key,
    required this.colorSelected,
    required this.changeColor,
  });

  final ColorSelection colorSelected;
  final void Function(int index) changeColor;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
        onSelected: changeColor,
        icon: Icon(Icons.opacity_outlined),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        itemBuilder: (context) {
          return List.generate(ColorSelection.values.length, (index) {
            final currentColor = ColorSelection.values[index];
            return PopupMenuItem(
                value: index,
                enabled: currentColor != colorSelected,
                child: Row(
                  spacing: 10,
                  children: [
                    Icon(
                      Icons.color_lens,
                      color: currentColor.color,
                    ),
                    Text(currentColor.label),
                  ],
                ));
          });
        });
  }
}
