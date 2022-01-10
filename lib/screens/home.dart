import 'package:flutter/material.dart';
import 'package:survey_project/screens/opinion.dart';
import 'package:survey_project/utils/myColors.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool opinionComplete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 64.0, 0, 0),
          child: (Column(
            children: [
              const Text(
                "Opiniones",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                        color:
                            !opinionComplete ? myPink : Colors.green.shade300,
                        shape: BoxShape.circle),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Icon(
                        !opinionComplete
                            ? FeatherIcons.messageCircle
                            : FeatherIcons.check,
                        size: 70,
                        color: !opinionComplete
                            ? myPinkDarker
                            : Colors.green.shade500,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                !opinionComplete
                    ? "¡Tu opinión nos importa!"
                    : "¡Lo hemos recibido!",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60.0, vertical: 8.0),
                child: Text(
                  !opinionComplete
                      ? "Deja tus comentarios u opiniones para que una Mejor Niñez pueda trabajar en ello"
                      : "Tus comentarios han sido enviados correctamente",
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                child: Text(
                    !opinionComplete
                        ? "Realizar opinión"
                        : "Enviar otro comentario",
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.fromLTRB(12.0, 0, 12.0, 0)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue.shade600)),
                onPressed: () {
                  !opinionComplete
                      ? awaitFromOpinion(context)
                      : setState(() {
                          opinionComplete = false;
                        });
                },
              ),
              TextButton(
                child: const Text(
                  "Cambiar perfil",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {},
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FeatherIcons.alertTriangle,
                          color: Colors.grey.shade400,
                          size: 30.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          FeatherIcons.messageCircle,
                          color: Colors.blue.shade600,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  void awaitFromOpinion(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OpinionScreen()),
    );
    setState(() {
      opinionComplete = result;
    });
  }
}
