import 'package:flutter/material.dart';
import 'package:open_gym/providers/plates.dart';

import '../models/plates.dart';

class PlateCalculatorScreen extends StatefulWidget {
  static const routeName = '/plate-calculator';
  final double? weightFromOtherScreen;

  const PlateCalculatorScreen({Key? key, this.weightFromOtherScreen})
      : super(key: key);

  @override
  State<PlateCalculatorScreen> createState() => _PlateCalculatorScreenState();
}

class _PlateCalculatorScreenState extends State<PlateCalculatorScreen> {
  List<double> availiblePlates = [];
  late double _weight;
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _barWeightController =
      TextEditingController(text: '45');

  static const List<Widget> _plates = <Widget>[
    Text('LB'),
    Text('KG'),
  ];
  final List<bool> _selectedPlate = <bool>[true, false];

  @override
  void initState() {
    if (widget.weightFromOtherScreen == null) {
      _weight = 0.0;
    } else {
      _weight = widget.weightFromOtherScreen!;
    }
    _weightController.text = _weight.toString();
    // TODO: implement initState
    super.initState();
  }

  Widget kgPlates() {
    listHandler(kgPlateOptions);
    return GridView.builder(
      key: UniqueKey(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 3
      ),
      itemBuilder: (context, index) {
        return CheckboxListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
            title: Text(kgPlateOptions[index].value.toStringAsFixed(2)),
            value: kgPlateOptions[index].availible,
            onChanged: (bool? value) {
              setState(() {
                kgPlateOptions[index].availible = value;
                listHandler(kgPlateOptions);
              });
            });
      },
      itemCount: lbPlateOptions.length,
    );
  }

  void listHandler(List<Plate> plates){
    availiblePlates = [];
    for(Plate plate in plates){
      if ( plate.availible == true ){
        availiblePlates.add(plate.value);
      }
    }
    print(availiblePlates);
  }

  Widget lbPlates(BuildContext context) {
    listHandler(lbPlateOptions);
    return GridView.builder(
      key: UniqueKey(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, childAspectRatio: 3
      ),
      itemBuilder: (context, index) {
        return CheckboxListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
            title: Text(lbPlateOptions[index].value.toStringAsFixed(2)),
            value: lbPlateOptions[index].availible,
            onChanged: (bool? value) {
              setState(() {
                lbPlateOptions[index].availible = value;
                listHandler(lbPlateOptions);
              });
            });
      },
      itemCount: lbPlateOptions.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plate Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Weight'),
                  SizedBox(
                    width: 45,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: _weightController,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Bar Weight'),
                  SizedBox(
                    width: 45,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: _barWeightController,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ToggleButtons(
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selectedPlate.length; i++) {
                      _selectedPlate[i] = i == index;
                    }
                  });
                },
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 80.0,
                ),
                isSelected: _selectedPlate,
                children: _plates),
            _selectedPlate[0] == true ? lbPlates(context) : kgPlates(),
          ],
        ),
      ),
    );
  }
}
