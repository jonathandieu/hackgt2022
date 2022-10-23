import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _State();
}

class _State extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bor-B-Gone',
          style: TextStyle(color: Colors.greenAccent),
        ),
      ),
      body: Center(
        child: Column (
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30, bottom: ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 120,
              color: Colors.green.shade700,
              child: Text(
                "Got something that might interest ya!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            const CustomSlider()
          ]
        )
      )
    );
  }
}


class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  RangeValues _currentRangeValues = const RangeValues(0, 20);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      values: _currentRangeValues,
      max: 200,
      divisions: 5,
      labels: RangeLabels(
        _currentRangeValues.start.round().toString(),
        _currentRangeValues.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          _currentRangeValues = values;
        });
      },
    );
  }}