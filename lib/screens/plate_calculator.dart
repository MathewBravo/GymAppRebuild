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
  List<Plate> availiblePlates = [];
  List<Plate> requiredPlates = [];
  late double _weight;
  bool _validWeight = true;
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
      _weight = 0;
    } else {
      _weight = widget.weightFromOtherScreen!;
    }
    _weightController.text = _weight.toStringAsFixed(0);
    super.initState();
  }

  Widget kgPlates() {
    listHandler(kgPlateOptions);
    return GridView.builder(
      key: UniqueKey(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 4),
      itemBuilder: (context, index) {
        return CheckboxListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
            title: Text(kgPlateOptions[index].value.toStringAsFixed(2)),
            value: kgPlateOptions[index].availible,
            onChanged: (bool? value) {
              setState(() {
                kgPlateOptions[index].availible = value;
                listHandler(kgPlateOptions);
                calculateRequired();
              });
            });
      },
      itemCount: kgPlateOptions.length,
    );
  }

  void listHandler(List<Plate> plates) {
    availiblePlates = [];
    for (Plate plate in plates) {
      plate.needed = 1;
      if (plate.availible == true) {
        availiblePlates.add(plate);
      }
    }
  }



  void calculateRequired(){
    // print('called')_selectedPlate[0] == true ? lbPlates(context) : kgPlates();
    requiredPlates = [];
    double weight = double.parse(_weightController.text);
    double barWeight = double.parse(_barWeightController.text);
    double total = weight - barWeight;
    double perSide = total / 2.0;
    _validWeight = true;
    if(_selectedPlate[0] == true){
      if(perSide % 2.5 != 0){
        _validWeight = false;
        return;
      }
    }else{
      if(perSide % 0.5 != 0){
        _validWeight = false;
        return;
      }
    }
    for(int i = 0; i < availiblePlates.length ; i++){
      while(perSide >= availiblePlates[i].value){
        perSide -= availiblePlates[i].value;
        if(requiredPlates.contains(availiblePlates[i])){
          var matching = requiredPlates.firstWhere((element) => element == availiblePlates[i]);
          matching.needed = matching.needed + 1;
        }else{
          requiredPlates.add(availiblePlates[i]);
        }
      }
    }
    for(Plate plate in requiredPlates){
      print('${ plate.needed } of ${plate.value}');
    }
  }

  Widget lbPlates(BuildContext context) {
    listHandler(lbPlateOptions);
    return GridView.builder(
      key: UniqueKey(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 4),
      itemBuilder: (context, index) {
        return CheckboxListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
            title: Text(lbPlateOptions[index].value.toStringAsFixed(2)),
            value: lbPlateOptions[index].availible,
            onChanged: (bool? value) {
              setState(() {
                lbPlateOptions[index].availible = value;
                listHandler(lbPlateOptions);
                calculateRequired();
              });
            });
      },
      itemCount: lbPlateOptions.length,
    );
  }

  Widget plateShape(Plate plate) {
    return Row(
      children: [
        Container(
            width: plate.size,
            height: plate.size,
            margin: const EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                color: plate.color,
                shape: BoxShape.circle,
                border: Border.all(
                    color: Colors.black,
                    width: 3,
                    strokeAlign: StrokeAlign.inside)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                plate.value > 3
                    ? Text(
                        plate.value.toStringAsFixed(0),
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: plate.fontColor),
                      )
                    : Text(
                        plate.value.toStringAsFixed(2),
                        style: TextStyle(color: plate.fontColor, fontWeight: FontWeight.bold),
                      ),
              ],
            )),
        SizedBox(width: 10,),
        Text('X ${plate.needed.toString()}')
      ],
    );
  }

  Widget plateCalc() {
    if(_weightController.text == '0'){
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No Weight Given'),
      );
    }
    if(!_validWeight){
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Weight not achievable with availible plates'),
      );
    }
    if(requiredPlates.length == 0){
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('No Plates Selected'),
      );
    }
    calculateRequired();
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                plateShape(requiredPlates[index]),
                plateShape(requiredPlates[index]),
              ],
            );
          },
          itemCount: requiredPlates.length,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plate Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
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
                      onFieldSubmitted: (_){
                        setState(() {
                          calculateRequired();
                        });
                      },
                    ),
                  ),
                ],
              ),
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
                      onFieldSubmitted: (_){
                        setState(() {
                          calculateRequired();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ToggleButtons(
                onPressed: (int index) {
                  setState(() {
                    for (int i = 0; i < _selectedPlate.length; i++) {
                      _selectedPlate[i] = i == index;
                    }
                    if(_selectedPlate[0] == true){
                      listHandler(lbPlateOptions);
                    }else{
                      listHandler(kgPlateOptions);
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
            plateCalc(),
          ],
        ),
      ),
    );
  }
}
