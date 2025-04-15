// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scarlet_app/data/user_services.dart';
import 'package:scarlet_app/screens/authentication/confirm_number_page.dart';
import 'package:scarlet_app/screens/authentication/register_page.dart';
import 'package:scarlet_app/widgets/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Country {
  final String name;
  final String dialCode;

  Country(this.name, this.dialCode);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Country && other.name == name && other.dialCode == dialCode;
  }

  @override
  int get hashCode => name.hashCode ^ dialCode.hashCode;
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final ApiService apiService = ApiService();

  double scale = 1.0;

  String textButton = "Continúa";
  Widget _errorNumMessage =
      const Visibility(visible: false, child: Text("data"));
  List<Country> countries = [
    Country("Bolivia", "+591"),
    Country("Venezuela", "+58"),
    Country("USA", "+1"),
    Country("UK", "+44"),
    Country("France", "+33"),
  ];

  Country selectedCountry = Country("Bolivia", "+591");

  bool continueButtom = true;
  bool booleanLogin = true;
  bool booleanPassword = false;
  bool booleanNumber = false;
  String texto = "Iniciar con número de teléfono";
  Image icono = const Image(
    height: 30,
    width: 30,
    image: AssetImage("assets/img/logos/phone-logo.png"),
  );

  @override
  void initState() {
    super.initState();

    numberController.addListener(() {
      setState(
        () {
          if (!continueButtom) {
            textButton = "Continúa";
            continueButtom = true;
            _errorNumMessage = const Visibility(
              visible: false,
              child: Text(
                  "Este número no está registrado, puedes continuar con el proceso de registro."),
            );
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    Widget emailLogin = Visibility(
      visible: booleanLogin,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.black45,
            width: 1.0,
          ),
        ),
        width: 295,
        height: 38,
        child: TextField(
          cursorColor: Colors.black45,
          controller: emailController,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z@.]")),
          ],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: "DM Sans",
          ),
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(30, 20, 0, 10),
            border: InputBorder.none,
            labelText: "Correo electrónico",
            labelStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0XFF5E5E5E),
                height: 0.5),
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );

    Widget passwordLogin = Visibility(
      visible: booleanPassword,
      child: Container(
        width: 295,
        height: 38,
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
              obscureText: true,
              controller: passwordController,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "DM Sans",
              ),
              keyboardType: TextInputType.text,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z@.]")),
              ],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(30, 20, 0, 8),
                border: InputBorder.none,
                labelText: "Contraseña",
                labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF5E5E5E),
                    height: 0.5),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ],
        ),
      ),
    );

    Widget numberLogin = Visibility(
      visible: booleanNumber,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Colors.black45,
            width: 1.0,
          ),
        ),
        width: 295,
        child: Column(
          children: [
            DropdownButtonFormField<Country>(
              value: selectedCountry,
              onChanged: (Country? newValue) {
                setState(() {
                  selectedCountry = newValue!;
                  codeController.text = newValue.dialCode;
                });
              },
              items: countries.map((Country country) {
                return DropdownMenuItem<Country>(
                  value: country,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text(
                      "${country.name} (${country.dialCode})",
                      style: const TextStyle(
                        color: Colors.black45,
                        fontSize: 12,
                        fontFamily: "DM Sans",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.fromLTRB(30, 8, 0, 0),
                labelText: "País",
                labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF5E5E5E),
                    height: 0.5),
              ),
            ),
            const Divider(
              color: Colors.black45,
              height: 1.0,
              thickness: 1.0,
            ),
            TextField(
              cursorColor: Colors.black45,
              controller: numberController,
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 12,
                fontFamily: "DM Sans",
                fontWeight: FontWeight.w600,
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(8),
                FilteringTextInputFormatter.allow(RegExp("[0-9]")),
              ],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(30, 13, 0, 0),
                border: InputBorder.none,
                labelText: "Número de teléfono",
                labelStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF5E5E5E),
                    height: 0.5),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
              ),
            ),
          ],
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Iniciar sesión o registrarse",
          style: TextStyle(
              color: Color(0xFF656565),
              fontSize: 19,
              fontFamily: "DM Sans",
              fontWeight: FontWeight.w600),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(width: 1, color: Colors.grey)),
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            children: <Widget>[
              Column(
                children: [
                  Image.asset(
                    "assets/img/logos/wildfire-logo.png",
                    width: 313,
                    height: 350,
                  ),
                  emailLogin,
                  numberLogin,
                  const Padding(padding: EdgeInsets.all(3)),
                  passwordLogin,
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: _errorNumMessage,
                  ),
                  SizedBox(
                    height: 44,
                    width: 290,
                    child: AnimatedScale(
                      scale: scale,
                      duration: const Duration(milliseconds: 200),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              const WidgetStatePropertyAll<Color>(
                                  Color(0xFFDF8946)),
                          shape: WidgetStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11.0),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (!booleanLogin) {
                            if (numberController.text != "" &&
                                numberController.text.length == 8) {
                              String number = "+591${numberController.text}";
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConfirmNumber(
                                    number: number,
                                  ),
                                ),
                              );
                            }
                          } else {
                            if (emailController.text != "") {
                              var res = await apiService
                                  .getByEmail(emailController.text);
                              if (res.statusCode == 200) {
                                booleanPassword = true;
                                if (passwordController.text != "") {
                                  var loginResult = await apiService.checkLogin(
                                      emailController.text,
                                      passwordController.text);
                                  if (loginResult.statusCode == 200) {
                                    final prefs = await _prefs;
                                    if(loginResult.body.isNotEmpty) {
                                      Map<String, dynamic> responseBody =
                                        jsonDecode(loginResult.body);
                                      await prefs.setInt(
                                          'id', responseBody['id']);
                                    }
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const NavBar(
                                          initialIndex: 2,
                                        ),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Container(
                                          height: 80,
                                          width: screenWidth * 0.7,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40, vertical: 20),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color: const Color(0xFFA20E0E),
                                              width: 1.0,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withAlpha(50),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(
                                                Icons.warning_amber_outlined,
                                                color: Color(0xFFA20E0E),
                                                size: 40,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Error al iniciar sesión. Por favor, revisa tu contraseña.',
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            Color(0xFFA20E0E)),
                                                  )
                                                ],
                                              ))
                                            ],
                                          )),
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0,
                                    ));
                                  }
                                }
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(
                                      newEmail: emailController.text,
                                    ),
                                  ),
                                );
                              }
                            } else {
                              if (emailController.text != "") {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                      height: 80,
                                      width: screenWidth * 0.7,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border: Border.all(
                                          color: const Color(0xFFA20E0E),
                                          width: 1.0,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withAlpha(50),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.warning_amber_outlined,
                                            color: Color(0xFFA20E0E),
                                            size: 40,
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                              child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Ingrese su correo!.',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFFA20E0E)),
                                              )
                                            ],
                                          ))
                                        ],
                                      )),
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                ));
                              }
                            }
                          }
                          await Future.delayed(
                              const Duration(milliseconds: 150));
                          setState(() {
                            scale = 1.0;
                          });
                        },
                        child: Center(
                          child: Text(
                            textButton,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "DM Sans",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    children: <Widget>[
                      Expanded(
                        child: Divider(
                          color: Color.fromRGBO(196, 196, 196, 0.80),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                        child: Text(
                          "o",
                          style: TextStyle(
                            color: Color.fromRGBO(196, 196, 196, 0.80),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 2,
                          color: Color.fromRGBO(196, 196, 196, 0.80),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      height: 40,
                      width: 290,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (booleanLogin == true) {
                              numberController.text = "";
                              booleanLogin = false;
                              booleanNumber = true;
                              booleanPassword = false;
                              texto = "Iniciar con correo electrónico";
                              icono = const Image(
                                height: 30,
                                width: 30,
                                image: AssetImage(
                                    "assets/img/logos/email-logo.png"),
                              );
                            } else {
                              emailController.text = "";
                              booleanLogin = true;
                              booleanNumber = false;
                              booleanPassword = false;
                              texto = "Iniciar con número telefónico";
                              icono = const Image(
                                height: 30,
                                width: 30,
                                image: AssetImage(
                                    "assets/img/logos/phone-logo.png"),
                              );
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color(0xffBABABA),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              icono,
                              const SizedBox(width: 5.0),
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                              ),
                              Text(
                                texto,
                                style: const TextStyle(
                                  color: Color(0xFF575757),
                                  fontSize: 12,
                                  fontFamily: "DM Sans",
                                  fontWeight: FontWeight.w600,
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
            ],
          ),
          Positioned(
            top: screenHeight * 0.8,
            left: screenWidth / 2 - 25,
            child: const Image(
              height: 50,
              width: 50,
              image: AssetImage("assets/img/logos/cemento-base.png"),
            ),
          ),
        ],
      ),
    );
  }
}
