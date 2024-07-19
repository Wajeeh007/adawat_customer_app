import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/bottom_sheet_item_model.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({super.key, required this.itemsList, required this.index});

  final int index;
  final RxList<BottomSheetItemModel> itemsList;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(!itemsList[index].isSelected!) {
          for (var element in itemsList) {
            element.isSelected = false;
          }
          itemsList[index].isSelected = true;
          itemsList.refresh();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemsList[index].text!,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          AnimatedContainer(
            height: 18,
            width: 18,
            duration: const Duration(milliseconds: 350),
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 0.8,
                  color: itemsList[index].isSelected! ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                )
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: itemsList[index].isSelected! ? Theme.of(context).colorScheme.primary : Colors.transparent,
              ),
            ),
          )
        ],
      ),
    );
  }
}