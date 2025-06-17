import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'feed_page.dart';
import '../providers/login_provider.dart';
import '../providers/perfil_provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final perfilProvider = Provider.of<PerfilProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Plataforma Profissional Anônima",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                "Autenticação segura",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _userController,
                decoration: InputDecoration(labelText: "Usuário"),
              ),
              TextField(
                controller: _passController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Senha"),
              ),
              SizedBox(height: 20),

              loginProvider.isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        loginProvider.setUsuario(_userController.text.trim());
                        loginProvider.setSenha(_passController.text.trim());

                        bool sucesso =
                            await loginProvider.login(perfilProvider);

                        if (sucesso) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => FeedPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(loginProvider.error ?? 'Erro no login')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                      child: Text("Entrar", style: TextStyle(fontSize: 16)),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
