// ignore_for_file: use_build_context_synchronously, unused_field

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scarlet_app/data/user_services.dart';
import 'package:scarlet_app/widgets/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterNumberPage extends StatefulWidget {
  final String phone;
  const RegisterNumberPage({super.key, required this.phone});

  @override
  State<RegisterNumberPage> createState() => _RegisterNumberPageState();
}

class _RegisterNumberPageState extends State<RegisterNumberPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final ApiService apiService = ApiService();

  Widget _errorNameMessage = const Visibility(
    visible: false,
    child: Text(""),
  );
  Widget _errorNameEmailPassword = const Visibility(
    visible: false,
    child: Text(""),
  );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Color(0xFF656565),
            ),
            iconSize: 19,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            "Última fase del registro",
            style: TextStyle(
                color: Color(0xFF656565),
                fontSize: 19,
                fontFamily: "DM Sans",
                fontWeight: FontWeight.w600),
          ),
          titleSpacing: -20,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey)),
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          bottom: true,
          left: true,
          right: true,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.11,
                  screenHeight * 0.05, screenWidth * 0.11, screenHeight * 0.05),
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.black45,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              TextField(
                                cursorColor: Colors.black45,
                                controller: nameController,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[a-zA-Z ]")),
                                ],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "DM Sans",
                                ),
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(30, 15, 0, 5),
                                  border: InputBorder.none,
                                  labelText: "Nombre",
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFF5E5E5E),
                                      height: 0.5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                ),
                              ),
                              const Divider(
                                color: Colors.black45,
                                height: 1.0,
                                thickness: 1.0,
                              ),
                              TextField(
                                cursorColor: Colors.black45,
                                controller: lastNameController,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "DM Sans",
                                ),
                                keyboardType: TextInputType.text,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp("[a-zA-Z ]")),
                                ],
                                decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(30, 15, 0, 5),
                                  border: InputBorder.none,
                                  labelText: "Apellido",
                                  labelStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0XFF5E5E5E),
                                      height: 0.5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _errorNameMessage,
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              screenWidth * 0.02,
                              screenHeight * 0.005,
                              screenWidth * 0.02,
                              screenHeight * 0.03),
                          child: const Text(
                            "Asegúrate de que coincide con el nombre que aparece en tu documento de identidad fiscal.",
                            style: TextStyle(
                                color: Color(0xFF8F8F8F),
                                fontSize: 10,
                                fontFamily: "DM Sans"),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.black45,
                              width: 1.0,
                            ),
                          ),
                          child: TextField(
                            cursorColor: Colors.black45,
                            controller: emailController,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp("[0-9a-zA-Z@.]")),
                            ],
                            style: const TextStyle(
                              color: Color(0XFF161616),
                              fontSize: 12,
                              fontFamily: "DM Sans",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(30, 8, 0, 8),
                              border: InputBorder.none,
                              labelText: "Correo electrónico",
                              labelStyle: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0XFF5E5E5E),
                                  height: 0.5),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              screenWidth * 0.02,
                              screenHeight * 0.005,
                              screenWidth * 0.02,
                              screenHeight * 0.03),
                          child: const Text(
                            "Te enviaremos las confirmaciones de reserva y recibos por correo electrónico.",
                            style: TextStyle(
                                color: Color(0xff8F8F8F),
                                fontSize: 10,
                                fontFamily: "DM Sans"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 46,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: const WidgetStatePropertyAll<Color>(
                            Color(0xFFDF8946)),
                        shape: WidgetStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(11.0),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        if (nameController.text.isEmpty) {
                          setState(() {
                            _errorNameMessage = SizedBox(
                              width: 500,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    screenWidth * 0.02,
                                    screenHeight * 0.005,
                                    screenWidth * 0.02,
                                    0),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image(
                                      height: 15,
                                      width: 15,
                                      image: AssetImage(
                                          "assets/img/icons/sms-failed.png"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8),
                                    ),
                                    Text(
                                      'Debes indicar el nombre',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFA20E0E),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                        } else {
                          _errorNameMessage = const Visibility(
                            visible: false,
                            child: Text(""),
                          );
                        }
                        if (nameController.text != "") {
                          setState(() {
                            _errorNameEmailPassword = const Visibility(
                              visible: false,
                              child: Text(""),
                            );
                          });
                          var response = await apiService.registerByPhoneNumber(
                              nameController.text,
                              lastNameController.text,
                              emailController.text,
                              widget.phone);
                          if (response.statusCode == 200) {
                            final prefs = await _prefs;
                            Map<String, dynamic> responseBody = jsonDecode(response.body);
                            await prefs.setInt(
                                'id', responseBody['id']);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavBar(initialIndex: 2,),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Error al registrar el usuario. Por favor, inténtalo de nuevo.')));
                          }
                        }
                      },
                      child: const Center(
                        child: Text(
                          "Aceptar y continuar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
