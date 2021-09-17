import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '/stores/signup_store/signup_store.dart';
import '../signup/components/field_title.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignupStoreController _signupStoreController =
        SignupStoreController();

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
                      Observer(builder: (context) {
                        return TextField(
                          enabled: !_signupStoreController.loading,
                          onChanged: _signupStoreController.setName,
                          decoration: InputDecoration(
                            errorText: _signupStoreController.nameError,
                            isDense: true,
                            border: OutlineInputBorder(),
                            hintText: "EX: João",
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: "E-mail",
                        subtitle: "Eniaremos um E-mail de confirmação",
                      ),
                      Observer(
                        builder: (context) => TextField(
                          onChanged: _signupStoreController.setEmail,
                          enabled: !_signupStoreController.loading,
                          decoration: InputDecoration(
                            errorText: _signupStoreController.emailError,
                            isDense: true,
                            border: OutlineInputBorder(),
                            hintText: "EX: João@hotmail.comn",
                          ),
                          autocorrect: false,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                        title: "Celular",
                        subtitle: "proteja sua conta",
                      ),
                      Observer(
                        builder: (context) => TextField(
                          keyboardType: TextInputType.number,
                          enabled: !_signupStoreController.loading,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          onChanged: _signupStoreController.setPhone,
                          decoration: InputDecoration(
                            errorText: _signupStoreController.phoneError,
                            isDense: true,
                            border: OutlineInputBorder(),
                            hintText: "EX: (99) 9 9999-9999",
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: "Senha",
                        subtitle: "use letras, numeros e caracteres especiais",
                      ),
                      Observer(
                        builder: (context) => TextField(
                          onChanged: _signupStoreController.setPassWord1,
                          enabled: !_signupStoreController.loading,
                          decoration: InputDecoration(
                            errorText: _signupStoreController.passWordError1,
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: "Confirmar Senha",
                        subtitle: "repita a senha",
                      ),
                      Observer(
                        builder: (context) => TextField(
                          onChanged: _signupStoreController.setPassWord2,
                          enabled: !_signupStoreController.loading,
                          decoration: InputDecoration(
                            errorText: _signupStoreController.passwordError2,
                            isDense: true,
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.only(top: 20, bottom: 12),
                        child: Observer(builder: (context) {
                          return MaterialButton(
                            onPressed: _signupStoreController.signupPressed,
                            disabledColor: Colors.orange.shade200,
                            color: Colors.orangeAccent,
                            child: _signupStoreController.loading
                                ? CircularProgressIndicator(
                                    color: Colors.blue,
                                  )
                                : Text("ENTRAR"),
                            textColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        }),
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
