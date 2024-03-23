import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 32, 84, 127)),
        useMaterial3: true,
      ),
      home: const CadastroPage(),
    );
  }
}

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
   final TextEditingController _dtnascimentoController = TextEditingController();

  void _cadastrar() {
    final username = _usernameController.text;
    final email = _emailController.text;
    final endereco = _enderecoController.text;
    final dtnascimento =_dtnascimentoController.text;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DadosPage(
          nome: username,
          email: email,
          endereco: endereco,
          dtnascimento: dtnascimento,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Nome de usuário',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _enderecoController,
              decoration: const InputDecoration(
                labelText: 'Endereço',
              ),
            ),
            const SizedBox(height: 20.0),
             TextFormField(
              controller: _dtnascimentoController,
              decoration: const InputDecoration(
                labelText: 'Data de Nascimento',
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _cadastrar,
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}

class DadosPage extends StatelessWidget {
  final String nome;
  final String email;
  final String endereco;
  final String dtnascimento;

  const DadosPage({
    super.key,
    required this.nome,
    required this.email,
    required this.endereco,
    required this.dtnascimento,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados do Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome de usuário: $nome',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Endereço: $endereco',
              style: const TextStyle(fontSize: 18),
            ),
             const SizedBox(height: 10),
            Text(
              'Data de Nacimento : $dtnascimento',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
