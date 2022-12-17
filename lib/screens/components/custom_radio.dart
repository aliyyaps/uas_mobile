import 'package:flutter/material.dart';
import 'package:uas_mobile/screens/components/gender.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({super.key, required this.gender});

  final Gender gender;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: gender.isSelected ? const Color(0xFF3B4257) : Colors.white,
        child: Container(
          height: 48,
          width: 48,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                gender.icon,
                color:
                    gender.isSelected ? Colors.white : const Color(0xff6777ef),
                size: 24,
              ),
              const SizedBox(height: 10),
              Text(
                gender.name,
                style: TextStyle(
                    fontSize: 12,
                    color: gender.isSelected
                        ? Colors.white
                        : const Color(0xff6777ef)),
              )
            ],
          ),
        ));
  }
}
