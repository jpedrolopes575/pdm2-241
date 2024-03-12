import 'dart:isolate';

void printMessage(message) {
  print("Mensagem do isolado: $message");
}

void main() async {
  // Criar um isolado
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(printMessage, "Olá, mundo! me chamo joão pedro Lopes Machado");

  // Esperar a resposta do isolado
  await receivePort.first;

  // Fechar o isolado
  receivePort.close();
  isolate.kill();
}
