import 'package:flutter/material.dart';
import 'package:survey_project/utils/faceButton.dart';
import 'package:survey_project/utils/myColors.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OpinionScreen extends StatefulWidget {
  const OpinionScreen({Key? key}) : super(key: key);

  @override
  _OpinionScreenState createState() => _OpinionScreenState();
}

class _OpinionScreenState extends State<OpinionScreen> {
  Color myColor = Colors.grey.shade300;
  List<IconData> myIcons = [
    FeatherIcons.frown,
    FeatherIcons.frown,
    FeatherIcons.meh,
    FeatherIcons.smile,
    FeatherIcons.smile
  ];
  List<String> states = ["Muy mal", "mal", "Indiferente", "Bien", "muy Bien"];
  int surveySteps = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        iconTheme: const IconThemeData.fallback(),
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Opniones",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularStepProgressIndicator(
                    totalSteps: 2,
                    currentStep: surveySteps,
                    stepSize: 8,
                    selectedColor: myPinkDarker,
                    unselectedColor: Colors.grey.shade300,
                    padding: 0,
                    width: 80,
                    height: 80,
                    selectedStepSize: 8,
                    roundedCap: (_, __) => true,
                    child: Center(child: Text("$surveySteps de 2")),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Opiniones"),
                      Text("Encuesta de satisfacción")
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (surveySteps == 1) ...[
                const Text("¿Qué te parece el servicio de Mejor Niñez?"),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    for (int i = 0; i < 5; i++)
                      FaceButton(
                          onPressed: () => setState(() => surveySteps = 2),
                          btnColor: myColor,
                          btnIcon: Icon(myIcons[i], color: Colors.grey[500]),
                          btnText: Text(
                            states[i],
                            style: TextStyle(color: Colors.grey[500]),
                          )),
                  ],
                ),
              ],
              if (surveySteps == 2) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "¿Cuál es tu nombre?",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Nombre y Apellido",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "¿Quieres que te contactemos?",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Ej. nombre@correo.com",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey.shade300,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "¿Quieres dejar algun comentario?",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Comentario",
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        isDense: true,
                      ),
                      maxLines: 5,
                    ),
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: TextButton(
                      child: const Text("Realizar opinión",
                          style:
                              TextStyle(color: Colors.white, fontSize: 16.0)),
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blue.shade600)),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
