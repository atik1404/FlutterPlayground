import 'package:first_flutter/feature/playground/chip/app_base_chip.dart';
import 'package:first_flutter/feature/playground/chip/app_choice_chip.dart'
    hide AppChipTone;
import 'package:flutter/material.dart';

class ChipComponentPlayground extends StatefulWidget {
  const ChipComponentPlayground({super.key});

  @override
  State<ChipComponentPlayground> createState() =>
      _ChipComponentPlaygroundState();
}

// ...existing code...
class _ChipComponentPlaygroundState extends State<ChipComponentPlayground> {
  Set<int> outlineSelectedIndexes = {};
  Set<int> filledSelectedIndexes = {};
  final Set<int> selectedIndexes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chip Playground"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText("Fare"),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildFareChip("Low to High"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildFareChip("High to Low"),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              _buildText("Car Type"),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildFareChip("Budget Sedan"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildFareChip("Sedan car"),
                  ),
                ],
              )
            ],
          )),
    );
  }

  Widget _buildAllCase() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        AppBaseChip(
          label: "Filled Capsule",
          leading: (color) => Icon(Icons.star, color: color),
          selected: true,
          shape: AppChipShape.capsule,
          tone: AppChipTone.fill,
          onTap: () {},
        ),
        AppBaseChip(
          label: "Outline Rounded",
          trailing: (color) => Icon(Icons.close, color: color),
          outline: true,
          shape: AppChipShape.rounded,
          tone: AppChipTone.outline,
          onTap: () {},
        ),
        AppBaseChip(
          label: "Rectangle",
          shape: AppChipShape.rectangle,
          tone: AppChipTone.fill,
        ),
        AppBaseChip(
          label: "Custom Color",
          labelStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          selected: true,
          shape: AppChipShape.rounded,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          onTap: () {},
        ),
        AppBaseChip(
          label: "Outline Capsule",
          leading: (color) => Icon(Icons.directions_car, color: color),
          trailing: (color) => Icon(Icons.info_outline, color: color),
          outline: true,
          shape: AppChipShape.capsule,
          borderColor: Colors.red,
          tone: AppChipTone.outline,
          onTap: () {},
        ),
        AppBaseChip(
          label: "Custom Size",
          selected: true,
          shape: AppChipShape.capsule,
          tone: AppChipTone.fill,
          height: 48,
          width: 160,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          onTap: () {},
        ),
        AppBaseChip(
          label: "No Ripple",
          outline: true,
          shape: AppChipShape.rectangle,
          tone: AppChipTone.fill,
          enableRippleEffect: false,
          onTap: () {},
        ),
        AppBaseChip(
          label: "Trailing Only",
          trailing: (color) => Icon(Icons.arrow_forward, color: color),
          selected: true,
          shape: AppChipShape.rounded,
          tone: AppChipTone.fill,
          onTap: () {},
        ),
        AppBaseChip(
          label: "Leading Only",
          leading: (color) => Icon(Icons.person, color: color),
          outline: true,
          shape: AppChipShape.capsule,
          tone: AppChipTone.fill,
          onTap: () {},
        ),
        AppBaseChip(
          label: "Custom Radius",
          selected: true,
          shape: AppChipShape.rectangle,
          tone: AppChipTone.fill,
          borderRadius: BorderRadius.circular(20),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildFareChip(String text) {
    return SizedBox(
      child: AppBaseChip(
        label: text,
        leading: (color) => Icon(Icons.car_rental_sharp, color: color),
        outline: true,
        shape: AppChipShape.rounded,
        tone: AppChipTone.outline,
        onTap: () {},
      ),
    );
  }

  Widget _buildText(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
    );
  }
}
// ...existing code...
