import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(IMC());
}

class IMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool showMessage = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      setState(() {
        showMessage = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '💪Calcule seu imc',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 190, 190, 190),
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 103, 221),
        toolbarHeight: 60,
        centerTitle: false,
        
      ),
      backgroundColor: Color.fromARGB(64, 68, 68, 68),

      body: Column(
        children: [
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: IMCCalculator(),
            ),
          ),
        ],
      ),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  const IMCCalculator({super.key});

  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  double height = 189.0;
  double weight = 72.0;
  int year = 19;

  void aumentarPeso() {
    setState(() {
      weight++;
    });
  }

  void diminuirPeso() {
    setState(() {
      if (weight > 0) {
        weight--;
      } else {
        weight = 0;
      }
    });
  }

  void aumentaIdade() {
    setState(() {
      if (year <= 99) {
        year++;
      } else {
        year = 0;
      }
    });
  }

  void diminuIdade() {
    setState(() {
      if (year > 0) {
        year--;
      } else {
        year = 0;
      }
    });
  }

  String classes(double bmi) {
    if (bmi == 0) {
      return '';
    } else if (bmi <= 18.40) {
      return 'Abaixo do peso';
    } else if (bmi >= 18.41 && bmi < 24.90) {
      return 'Peso ideal';
    } else if (bmi >= 24.91 && bmi < 29.90) {
      return 'Sobrepeso';
    } else {
      return 'Procure um médico. Nível de IMC elevado.';
    }
  }

  Color getColor(double bmi) {
    if (bmi == 0) {
      return Colors.white;
    } else if (bmi <= 18.40) {
      return Colors.red;
    } else if (bmi < 24.90) {
      return const Color.fromARGB(255, 61, 170, 65);
    } else if (bmi < 29.90) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  double calculateBMI() {
    double heightInMeters = height / 100.0;
    double bmi = weight / (heightInMeters * heightInMeters);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        key: const Key('data'),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ALTURA',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 82, 82, 82),
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    height.toStringAsFixed(2),
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Color.fromARGB(255, 213, 213, 213),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Text(
                    'cm',
                    style: TextStyle(
                      letterSpacing: 0,
                      height: 2,
                      fontSize: 14.0,
                      color: Color.fromARGB(255, 213, 213, 213),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Slider(
                value: height,
                onChanged: (newValue) {
                  setState(() {
                    height = newValue;
                  });
                },
                min: 100.0,
                max: 220.0,
                divisions: 150,
                label: height.toStringAsFixed(2),
                activeColor: const Color.fromARGB(255, 0, 174, 255),
                inactiveColor: const Color.fromARGB(44, 158, 158, 158),
              ),
              const SizedBox(height: 30), // Adicionando mais espaço abaixo do Slider
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(22, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                width: 175,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'PESO',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 82, 82, 82),
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          weight.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(
                          'kg',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: aumentarPeso,
                          child: const Icon(
                            Icons.add_circle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 65,
                          ),
                        ),
                        InkWell(
                          onTap: diminuirPeso,
                          child: const Icon(
                            Icons.remove_circle,
                            color: Color.fromARGB(255, 214, 214, 214),
                            size: 65,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(22, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                width: 175,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'IDADE',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 82, 82, 82),
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          year.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const Text(
                          'ys',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: aumentaIdade,
                          child: const Icon(
                            Icons.add_circle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 65,
                          ),
                        ),
                        InkWell(
                          onTap: diminuIdade,
                          child: const Icon(
                            Icons.remove_circle,
                            color: Color.fromARGB(255, 214, 214, 214),
                            size: 65,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(22, 255, 255, 255),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(30.0),
            width: 440,
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'IMC',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color.fromARGB(48, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                  Text(
                    calculateBMI().toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: getColor(calculateBMI()),
                    ),
                  ),
                  Text(
                    classes(calculateBMI()),
                    style: TextStyle(
                      fontSize: 14,
                      color: getColor(calculateBMI()),
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }
}
