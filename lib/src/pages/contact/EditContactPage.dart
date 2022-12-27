import 'package:bazara_tecnical_test/src/models/contact.dart';
import 'package:bazara_tecnical_test/src/pages/contact/IndexContactPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditContactPage extends StatefulWidget {
  const EditContactPage({super.key, required this.contact});
  final Contact contact;
  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  Contact? contact;
  final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _email = TextEditingController();

  @override
  void initState() {
    super.initState();
    contact = widget.contact;
    _firstName.text = (contact?.first_name).toString();
    _lastName.text = (contact?.last_name).toString();
    _phoneNumber.text = (contact?.phone_number).toString();
    _email.text = (contact?.email).toString();
    // _firstName.text=

    // print(contact?.email);
    // print(contact?.id);
  }

  @override
  Widget build(BuildContext context) {
    TextFormField inputFirstName = TextFormField(
      // controller: _firstName,
      controller: _firstName,
      autofocus: true,
      keyboardType: TextInputType.text,
      inputFormatters: [
        LengthLimitingTextInputFormatter(45),
      ],
      decoration: const InputDecoration(
        labelText: 'First Name',
        icon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The field of first name is required';
        }
        return null;
      },
    );

    TextFormField inputLastName = TextFormField(
      controller: _lastName,
      // controller: _lastName,
      keyboardType: TextInputType.text,
      inputFormatters: [
        LengthLimitingTextInputFormatter(25),
      ],
      decoration: const InputDecoration(
        labelText: 'Last Name',
        icon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The field of last name is required';
        }
        return null;
      },
    );

    TextFormField inputPhoneNumber = TextFormField(
      controller: _phoneNumber,
      // controller: _phoneNumber,
      keyboardType: TextInputType.phone,
      decoration: const InputDecoration(
        labelText: "Phone Number",
        icon: Icon(Icons.phone),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The field of phone number is required';
        }
        return null;
      },
    );

    TextFormField inputEmail = TextFormField(
      // controller: _email,
      controller: _email,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
      ],
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'E-mail',
        icon: Icon(Icons.email),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The field of email is required';
        }
        return null;
      },
    );

    final picture = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 120.0,
          height: 120.0,
          child: const CircleAvatar(
            child: Icon(
              Icons.person,
              size: 60.0,
            ),
          ),
        ),
      ],
    );

    ElevatedButton submitButton = ElevatedButton(
      onPressed: () async {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (_formKey.currentState!.validate()) {
          final updatecontact = Contact(
              first_name: _firstName.text,
              last_name: _lastName.text,
              phone_number: _phoneNumber.text,
              email: _email.text);

          UpdateContact(updatecontact, '${contact?.id}');
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const IndexContactPage()));
        }
      },
      child: Text('Save'),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        minimumSize: const Size.fromHeight(50),
      ),
    );

    ListView content = ListView(
      padding: EdgeInsets.all(20),
      children: <Widget>[
        const SizedBox(height: 40),
        picture,
        const SizedBox(height: 20),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              inputFirstName,
              inputLastName,
              inputPhoneNumber,
              inputEmail,
              const SizedBox(
                height: 40,
              ),
              submitButton
            ],
          ),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text("Update Contact"),
      ),
      body: content,
    );
  }
}
