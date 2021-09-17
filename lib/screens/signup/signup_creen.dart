import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';

import '../signup/components/field_title.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 9,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FieldTitle(
                        title: "Apelido",
                        subtitle: "como aparecerá em seus anuncios",
                      ),
                      TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                          hintText: "EX: João",
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: "E-mail",
                        subtitle: "Eniaremos um E-mail de confirmação",
                      ),
                      TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                          hintText: "EX: João@hotmail.comn",
                        ),
                        autocorrect: false,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: "Celular",
                        subtitle: "proteja sua conta",
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                          hintText: "EX: (11) 9 1111-1111",
                        ),
                      ),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: "Senha",
                        subtitle: "use letras, numeros e caracteres especiais",
                      ),
                      TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: "Confirmar Senha",
                        subtitle: "repita a senha",
                      ),
                      TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.orangeAccent,
                          child: Text("ENTRAR"),
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Já tem uma conta?",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.purple,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
