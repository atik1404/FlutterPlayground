import 'package:flutter/material.dart';

import 'custom_thumb_widget.dart';

class ComponentPlaygroundScreen extends StatefulWidget {
  const ComponentPlaygroundScreen({super.key});

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<ComponentPlaygroundScreen> {
  double defaultValue = 50;
  double noPaddingValue = 50;
  double thumbIconValue = 50;
  double sliderWithValue = 30;
  double sliderWithValueAndShape = 90;
  RangeValues currentRangeValues = const RangeValues(0, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Default slider:'),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4.0,
              ),
              child: Slider(
                value: currentRangeValues.end,
                min: 0,
                max: 100,
                divisions: 5,
                onChanged: (value) {
                  setState(() {
                    currentRangeValues = RangeValues(0, value);
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Remove Slider Padding:'),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4.0,
                overlayShape: SliderComponentShape.noOverlay,
              ),
              child: Slider(
                value: noPaddingValue,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    noPaddingValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text('Slider with thumb icon:'),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: CustomThumbWidget(),
                thumbColor: Colors.blue,
                activeTrackColor: Colors.blue,
                overlayColor: Colors.blue.withOpacity(0.2),
              ),
              child: Slider(
                value: thumbIconValue,
                min: 0,
                max: 100,
                onChanged: (value) {
                  setState(() {
                    thumbIconValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(height: 70,
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [

                const Text('Slider with value:'),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 10,
                    ),
                  ),
                  child: Slider(
                    value: sliderWithValue,
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      setState(() {
                        sliderWithValue = value;
                      });
                    },
                  ),
                ),
                Positioned(
                    left: (sliderWithValue / 100) * (MediaQuery.of(context).size.width - 64), // Align with thumb
                    bottom: 00,
                    child: Text(
                      sliderWithValue.toInt().toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ],
            )),
            const SizedBox(height: 20),
            SizedBox(height: 100,
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                const Text('Slider with value and value shape:'),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4.0,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 10,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Slider(
                          value: sliderWithValueAndShape,
                          min: 0,
                          max: 100,
                          onChanged: (value) {
                            setState(() {
                              sliderWithValueAndShape = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: (sliderWithValueAndShape / 100) *
                      (MediaQuery.of(context).size.width - 64), // Align with thumb
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      sliderWithValueAndShape.toInt().toString(),
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),)
          ],
        ),
      ),
    );
  }
}
