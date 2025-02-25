
import 'package:byte_bank/database/dao/contact_dao.dart';
import 'package:flutter/material.dart';

import '../models/Contact.dart';

class ContactForm extends StatefulWidget {

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('New Contact'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full name',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
             Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account number',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox( // como ElevatedButton não possui width, usamos SizedBox para alterar o tamanho do botão
                width: double.maxFinite, // fazer o botão preencher toda a tela no sentido horizontal
                child: ElevatedButton(
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber = int.tryParse(_accountNumberController.text)!; // using the ! operator to explicitly tell the dart compiler that although the variable can be nullable I guarantee that it's not null
                    final Contact newContact = Contact(0, name, accountNumber);
                    debugPrint(newContact.toString());
                    debugPrint('Estou em elevated button');
                    _dao.save(newContact).then((id) => Navigator.pop(context));


                  },
                  child: Text('Create'),
                ),
              ),
            ),
          ],
        ),
      ),
  );
  }
}
