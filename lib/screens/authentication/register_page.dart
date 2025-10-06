// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scarlet_app/data/user_services.dart';
import 'package:scarlet_app/widgets/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  final String? newEmail;

  const RegisterPage({super.key, this.newEmail});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController intcarnetController = TextEditingController();
  TextEditingController stringcarnetController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  late TextEditingController emailController;
  TextEditingController usuarioController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();

    emailController = TextEditingController(text: widget.newEmail);
  }

  bool passwordBool = false;

  bool hidePassword = true;
  bool boolMostrar = true;

  String textMostrar = "Mostrar";

  Widget _errorNameMessage = const Visibility(
    visible: false,
    child: Text(""),
  );
  Widget _errorPasswordMessage = const Visibility(
    visible: false,
    child: Text(""),
  );
  Widget _errorCharacterCountMessage = const Visibility(
    visible: false,
    child: Text(""),
  );
  Widget _errorEspecialCharMessage = const Visibility(
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
                            readOnly: true,
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black45,
                        width: 1.0,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        TextField(
                          cursorColor: Colors.black45,
                          obscureText: hidePassword,
                          controller: passwordController,
                          style: const TextStyle(
                            color: Color(0XFF161616),
                            fontSize: 12,
                            fontFamily: "DM Sans",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp("[0-9a-zA-Z@.]")),
                          ],
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(30, 8, 0, 8),
                            border: InputBorder.none,
                            labelText: "Contraseña",
                            labelStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0XFF5E5E5E),
                                height: 0.5),
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (hidePassword == false) {
                                    hidePassword = true;
                                  } else {
                                    hidePassword = false;
                                  }
                                  if (boolMostrar == true) {
                                    textMostrar = "Ocultar";
                                    boolMostrar = false;
                                  } else {
                                    boolMostrar = true;
                                    textMostrar = "Mostrar";
                                  }
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Stack(
                                  children: [
                                    Text(
                                      textMostrar,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Color(0xff545454),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        height: 1,
                                        color: const Color(0xff545454),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _errorPasswordMessage,
                  _errorCharacterCountMessage,
                  _errorNameEmailPassword,
                  _errorEspecialCharMessage,
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        screenWidth * 0.02,
                        screenHeight * 0.005,
                        screenWidth * 0.02,
                        screenHeight * 0.03),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text:
                                "Al seleccionar “Aceptar y continuar” confirmo que estoy de acuerdo con los ",
                            style:
                                TextStyle(color: Colors.black45, fontSize: 10),
                          ),
                          TextSpan(
                            text: "Términos y condiciones",
                            style: const TextStyle(
                              color: Color(0xFFF09707),
                              decoration: TextDecoration.underline,
                              fontSize: 10,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(
                            text: "y la ",
                            style:
                                TextStyle(color: Colors.black45, fontSize: 10),
                          ),
                          TextSpan(
                            text: "Política contra la Discriminación",
                            style: const TextStyle(
                              color: Color(0xFFF09707),
                              decoration: TextDecoration.underline,
                              fontSize: 10,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(
                            text: " de '!Scarlet'. Acepto que leí la ",
                            style:
                                TextStyle(color: Colors.black45, fontSize: 10),
                          ),
                          TextSpan(
                            text: "Política de privacidad.",
                            style: const TextStyle(
                              color: Color(0xFFF09707),
                              decoration: TextDecoration.underline,
                              fontSize: 10,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
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
                        _errorPasswordMessage = SizedBox(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(screenWidth * 0.015,
                                screenHeight * 0.005, screenWidth * 0.02, 0),
                            child: const Row(
                              children: [
                                Image(
                                  height: 15,
                                  width: 15,
                                  image: AssetImage(
                                      "assets/img/icons/sms-failed.png"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                ),
                                Text(
                                  "Seguridad de contraseña: Débil.",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFFCE1D1D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                        int specialCharacterCount(String text) {
                          final RegExp specialCharPattern =
                              RegExp(r'[!@#\$%^&*()_+{}\[\]:;<>,.?~\\]');
                          Iterable<RegExpMatch> matches =
                              specialCharPattern.allMatches(text);
                          return matches.length;
                        }

                        int numberCount(String text) {
                          final RegExp numberPattern = RegExp(r'[0-9]');

                          Iterable<RegExpMatch> matches =
                              numberPattern.allMatches(text);

                          return matches.length;
                        }

                        int numberCharCount =
                            numberCount(passwordController.text);
                        int especialCharCount =
                            specialCharacterCount(passwordController.text);
                        int characterCount = passwordController.text.length;
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
                                        color: Color(0xFFCE1D1D),
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
                        if (characterCount >= 8) {
                          setState(() {
                            _errorCharacterCountMessage = SizedBox(
                              width: 500,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    screenWidth * 0.015,
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
                                          "assets/img/icons/check.png"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                    ),
                                    Text(
                                      "Debe tener al menos 8 caracteres.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF979595),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        } else {
                          setState(
                            () {
                              _errorCharacterCountMessage = SizedBox(
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
                                        height: 10,
                                        width: 10,
                                        image: AssetImage(
                                            "assets/img/icons/x.png"),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 5,
                                        ),
                                      ),
                                      Text(
                                        "Debe tener al menos 8 caracteres.",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFFCE1D1D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        if (especialCharCount >= 1 || numberCharCount >= 1) {
                          setState(() {
                            _errorEspecialCharMessage = SizedBox(
                              width: 500,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    screenWidth * 0.015,
                                    screenHeight * 0.005,
                                    screenWidth * 0.02,
                                    0),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      children: [
                                        Image(
                                          height: 15,
                                          width: 15,
                                          image: AssetImage(
                                              "assets/img/icons/check.png"),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(2, 0, 0, 0),
                                        ),
                                        Text(
                                          "Debe tener al menos un simbolo o un número.",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF979595),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        } else {
                          setState(() {
                            _errorEspecialCharMessage = SizedBox(
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
                                      height: 10,
                                      width: 10,
                                      image:
                                          AssetImage("assets/img/icons/x.png"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    ),
                                    Text(
                                      "Debe tener al menos un simbolo o un número.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFCE1D1D),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        }
                        if (passwordController.text
                                .contains(nameController.text) ||
                            passwordController.text
                                .contains(emailController.text)) {
                          setState(() {
                            passwordBool = false;
                            _errorNameEmailPassword = SizedBox(
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
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Image(
                                        height: 10,
                                        width: 10,
                                        image: AssetImage(
                                            "assets/img/icons/x.png"),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    ),
                                    Text(
                                      "No puede incluir nombre o email",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFFCE1D1D),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        } else {
                          setState(() {
                            passwordBool = true;
                            _errorNameEmailPassword = SizedBox(
                              width: 500,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(
                                    screenWidth * 0.015,
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
                                          "assets/img/icons/check.png"),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                    ),
                                    Text(
                                      "No puede incluir nombre o email",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF979595),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        }

                        if (characterCount >= 8 &&
                            (especialCharCount >= 1 ||
                                numberCharCount >= 1 && passwordBool == true)) {
                          setState(() {
                            _errorPasswordMessage = const Visibility(
                              visible: false,
                              child: Text(""),
                            );
                            _errorCharacterCountMessage = const Visibility(
                              visible: false,
                              child: Text(""),
                            );
                            _errorEspecialCharMessage = const Visibility(
                              visible: false,
                              child: Text(""),
                            );
                            _errorNameEmailPassword = const Visibility(
                              visible: false,
                              child: Text(""),
                            );
                          });
                          try {
                            final result = await apiService.createUserByEmail(
                              name:  nameController.text,
                              lastname:  lastNameController.text,
                              email:  emailController.text,
                              password:  passwordController.text);
                            final prefs = await SharedPreferences.getInstance();
                            if (result['user']?['userId'] != null) {
                              final userId = int.tryParse(result['user']['userId'].toString()) ?? 0;
                              if (userId > 0) {
                                await prefs.setInt('id', userId);
                              } else {
                                throw Exception('ID de usuario no válido');
                              }
                            }
                            
                            if (result['token'] != null) {
                              await prefs.setString('token', result['token']);
                            }

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavBar(initialIndex: 2),
                              ),
                            );
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
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
