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
          'Calculadora de IMC',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(26, 226, 226, 226),
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.black,
        toolbarHeight: 120,
        centerTitle: true,
      ),
      backgroundColor: Colors.black26,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: showMessage
                ? Container(
                    key: const Key('message'),
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        'Carregando...',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white38,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  )
                : const IMCCalculator(),
          ),
        ),
      ),
    );
  }
}

class IMCCalculator extends StatefulWidget {
  const IMCCalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  double height = 189.0;
  double weight = 0.0;
  int year = 0;

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
      return 'Peso normal';
    } else if (bmi >= 24.91 && bmi < 29.90) {
      return 'Sobrepeso';
    } else {
      return 'Procure um médico. Nível de IMC elevado.'; // Adicione um valor padrão se necessário
    }
  }

  Color getColor(double bmi) {
    if (bmi == 0) {
      return Colors.white; // Define a cor padrão
    } else if (bmi <= 18.40) {
      return Colors.red; // Define a cor vermelha para IMC menor ou igual a 18.40
    } else if (bmi < 24.90) {
      return const Color.fromARGB(255, 61, 170, 65); // Define a cor verde para IMC menor que 24.90
    } else if (bmi < 29.90) {
      return Colors.orange; // Define a cor laranja para IMC menor que 29.90
    } else {
      return Colors.red; // Define a cor vermelha para IMC maior ou igual a 29.90
    }
  }

  double calculateBMI() {
    // Converte altura para metros
    double heightInMeters = height / 100.0;
    // Calcula o IMC
    double bmi = weight / (heightInMeters * heightInMeters);
    return bmi;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: const Key('data'),
      children: [
        Container(
          color: Colors.black,
          child: Column(
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
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(22, 255, 255, 255),
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
              width: 200,
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
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 14),
              width: 200,
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
  height: 16.0, //espaçamento
),
            Container(
          decoration: BoxDecoration(
          color: const Color.fromARGB(22, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(30.0),
        width:440,
        child: Center(
          child: Column(
            children: [
              // Exibir o resultado do IMC
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
  height: 29.0, // Espaçamento
  ),
   Container(
    
    child: Center(
      
              child: TextButton(
                onPressed: () {
                  print('Botão de texto pressionado');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Color.fromARGB(255, 6, 20, 0), 
                  backgroundColor: Color.fromARGB(212, 248, 248, 248),       
                  padding: const EdgeInsets.all(16.0),                 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0), 
                  ),
                ),
                child: const Text('Salvar resultado'),
              )
                  ),
                )

      ],
      
    );
    
  }
}
