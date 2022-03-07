import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:micro_gluco_meter/utils/routes.dart';
import 'package:micro_gluco_meter/widgets/custom_app_bar.dart';
import 'package:micro_gluco_meter/widgets/custom_button.dart';
import 'package:micro_gluco_meter/widgets/gender_card.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _ageTEC = TextEditingController();
  final TextEditingController _phoneNumberTEC = TextEditingController();

  late String _gender = '';

  _submit() {
    if (_formKey.currentState!.validate()) {
      if (_gender == '') {
        Fluttertoast.showToast(msg: "Please select gender.");
      } else {
        FocusScope.of(context).unfocus();
        Navigator.pushNamed(
          context,
          Routes.uploadImageScreen,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarText: "Registration"),
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _nameTEC,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  labelText: 'Name',
                ),
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) return "Name can't be empty.";
                  return null;
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _gender = "Male");
                    },
                    child: GenderCard(
                      iconData: Icons.male,
                      label: "Male",
                      opacity: _gender == "Male" ? 1.0 : 0.4,
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() => _gender = "Female");
                    },
                    child: GenderCard(
                      iconData: Icons.female,
                      label: "Female",
                      opacity: _gender == "Female" ? 1.0 : 0.4,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _ageTEC,
                maxLength: 2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  labelText: 'Age',
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) return "Age can't be empty.";
                  if (int.parse(value) > 100 || int.parse(value) <= 0) {
                    return "Invalid age.";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _phoneNumberTEC,
                maxLength: 10,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  labelText: 'Phone Number',
                  prefixText: "+91",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (value) {
                  if (value!.isEmpty) return "Phone Number can't be empty.";
                  if (value.length != 10) return "Invalid phone number.";
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        child: const Text(
          "SUBMIT",
          style: TextStyle(fontSize: 16),
        ),
        onPressed: _submit,
      ),
    );
  }

  @override
  void dispose() {
    _nameTEC.dispose();
    _ageTEC.dispose();
    _phoneNumberTEC.dispose();

    super.dispose();
  }
}
