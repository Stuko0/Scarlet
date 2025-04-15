import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMembersPage extends StatefulWidget {
  const AddMembersPage({super.key});

  @override
  State<AddMembersPage> createState() => _AddMembersPage();
}

class _AddMembersPage extends State<AddMembersPage> {
  final TextEditingController memberName = TextEditingController();
  final TextEditingController memberData = TextEditingController();
  final List<String> memberRoles = <String>[
    'Lider',
    'Comunicacion',
    'De Campo'
  ];
  late String rolValue;
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    rolValue = "De Campo";
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Agrega Miembros",
            style: TextStyle(
                fontFamily: "DMSans",
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          leading: InkWell(
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(
                screenWidth * 0.06, screenHeight * 0.01, screenWidth * 0.06, 0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        child: TextField(
                      controller: memberName,
                      keyboardType: TextInputType.name,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
                      ],
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff939393),
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        hintText: "Buscar Miembros Disponibles",
                      ),
                    )),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 128,
                      child: TextField(
                        controller: memberData,
                        keyboardType: TextInputType.multiline,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                              RegExp("[a-zA-Z ]")),
                        ],
                        maxLines: null,
                        expands: true,
                        textAlign: TextAlign.start,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff939393),
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                          hintText: "Detalles del nuevo miembro",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: const Text(
                            "Rol:",
                            style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Container(
                            width: 130,
                            height: 36,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Color(0xff939393), width: 1)),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300,
                                        color: Color(0xff939393)),
                                    elevation: 0,
                                    hint: const Text('Rol'),
                                    value: rolValue,
                                    icon: Icon(Icons.arrow_drop_down_rounded),
                                    items: memberRoles.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      setState(() {
                                        rolValue = value!;
                                      });
                                    }))),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Text(
                            "Fecha de Ingreso:",
                            style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Container(
                            width: 130,
                            height: 36,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: const Color(0xff939393), width: 1)),
                            child:InkWell(
                                onTap: () async {
                                  final DateTime? pickedDate =
                                      await showDatePicker(
                                    context: context,
                                    initialDate: selectedDate,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                  );
                                  if (pickedDate != null &&
                                      pickedDate != selectedDate) {
                                    setState(() {
                                      selectedDate = pickedDate;
                                    });
                                  }
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${selectedDate.toLocal()}'.split(' ')[0],
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Color(0xff939393)),
                                    ),const Spacer(),
                                    const Icon(Icons.arrow_drop_down_rounded),
                                  ],
                                )
                              ),
                            ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Expanded(
                          child: Text(
                            "Habilidades:",
                            style: TextStyle(
                                fontFamily: "DMSans",
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Column(
                          children: [
                            InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 34,
                                  width: 110,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffe3e5e9),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  child: const Text(
                                    "Habilidad 1",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                )),
                            const SizedBox(
                              height: 7,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 34,
                                  width: 110,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffe3e5e9),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  child: const Text(
                                    "Agregar +",
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 16, top: 16),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  decoration: const BoxDecoration(
                                      color: Color(0xffe3e5e9),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  child: const Text(
                                    "Cancelar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 50,
                                  width: 151,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  decoration: const BoxDecoration(
                                      color: Color(0xff75AEEB),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6))),
                                  child: const Text(
                                    "Guardar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "DMSans",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ))
                          ],
                        )))
              ],
            )),
      ),
    );
  }
}
