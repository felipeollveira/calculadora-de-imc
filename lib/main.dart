import 'dart:io';

class Pessoa{
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC(){
    if(peso <= 0 || altura <= 0){
      throw Exception("Peso e altura inválidos");
    }
    return peso / (altura * altura);
  }
}


void main() {
  try {
   print("Informe o nome da pessoa:");
    String? nome = stdin.readLineSync();

    print("Informe o peso em kg:");
    String? pesoInput = stdin.readLineSync();
    double peso = double.tryParse(pesoInput ?? '') ?? 0.0;

    print("Informe a altura em metros:");
    String? alturaInput = stdin.readLineSync();
    double altura = double.tryParse(alturaInput ?? '') ?? 0.0;

    Pessoa pessoa = Pessoa(nome ?? '', peso, altura);
    double imc = pessoa.calcularIMC();

    print("Nome: ${pessoa.nome}");
    print("Peso: ${pessoa.peso} kg");
    print("Altura: ${pessoa.altura} m");
    print("IMC: ${imc.toStringAsFixed(6)}"); // Apenas teste de formatacao

  } catch (error) {
    print("Erro: $error");
  }
}
