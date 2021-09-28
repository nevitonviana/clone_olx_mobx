import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '/stores/edit_account_store/edit_account_store.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EditAccountStoreController _editAccountStoreController =
        EditAccountStoreController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Edtar Conta"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            elevation: 9,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Observer(builder: (_) {
                    return IgnorePointer(
                      ignoring: _editAccountStoreController.loading,
                      child: LayoutBuilder(builder: (_, contrsints) {
                        return ToggleSwitch(
                          onToggle: _editAccountStoreController.setUserType,
                          minWidth: contrsints.biggest.width / 2.01,
                          labels: ["Particular", "Profissional"],
                          cornerRadius: 20,
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          activeBgColor: [Colors.purple],
                          initialLabelIndex:
                              _editAccountStoreController.userType?.index ?? 0,
                          totalSwitches: 2,
                        );
                      }),
                    );
                  }),
                  const SizedBox(height: 8),
                  Observer(builder: (_) {
                    return TextFormField(
                      enabled: !_editAccountStoreController.loading,
                      initialValue: _editAccountStoreController.name,
                      onChanged: _editAccountStoreController.setName,
                      decoration: InputDecoration(
                        errorText: _editAccountStoreController.nameError,
                        border: OutlineInputBorder(),
                        isDense: true,
                        label: Text("Nome *"),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  Observer(builder: (_) {
                    return TextFormField(
                      enabled: !_editAccountStoreController.loading,
                      initialValue: _editAccountStoreController.phone,
                      onChanged: _editAccountStoreController.setPhone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter(),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        errorText: _editAccountStoreController.phoneError,
                        border: OutlineInputBorder(),
                        isDense: true,
                        label: Text("Telefone *"),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  Observer(builder: (_) {
                    return TextFormField(
                      enabled: !_editAccountStoreController.loading,
                      onChanged: _editAccountStoreController.setPassword1,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: _editAccountStoreController.passwordError,
                        border: OutlineInputBorder(),
                        isDense: true,
                        label: Text("Nova Senha "),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  Observer(builder: (_) {
                    return TextFormField(
                      enabled: !_editAccountStoreController.loading,
                      onChanged: _editAccountStoreController.setPassword2,
                      obscureText: true,
                      decoration: InputDecoration(
                        errorText: _editAccountStoreController.passwordError,
                        border: OutlineInputBorder(),
                        isDense: true,
                        label: Text("Repetir Senha "),
                      ),
                    );
                  }),
                  const SizedBox(height: 13),
                  Observer(
                    builder: (_) {
                      return SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orangeAccent),
                            textStyle: MaterialStateProperty.all(
                              TextStyle(color: Colors.white),
                            ),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: _editAccountStoreController.savaPressed,
                          child: _editAccountStoreController.loading
                              ? CircularProgressIndicator()
                              : Text("Salvar"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 6),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                        textStyle: MaterialStateProperty.all(
                          TextStyle(color: Colors.white),
                        ),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text("Sair"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
