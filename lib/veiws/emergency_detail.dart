import 'package:derash/models/emergency.dart';
import 'package:derash/widgets/emergency_service_numbers.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmergencyDetail extends StatefulWidget {
  final Emergency emergency;

  const EmergencyDetail({Key? key, required this.emergency}) : super(key: key);

  @override
  State<EmergencyDetail> createState() => _EmergencyDetailState();
}

class _EmergencyDetailState extends State<EmergencyDetail> {
  bool learnMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(widget.emergency.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
           padding: const EdgeInsets.only(top: 13,bottom: 10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 245, 242, 242),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: widget.emergency.description.length,
                      itemBuilder: (ctx, index) {
                        return learnMore ||
                                widget.emergency.description[index]['isMain']
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width * 0.03),
                                child: Card(
                                  elevation: 3,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15, horizontal: 5),
                                        child: Text(
                                          widget.emergency.description[index]
                                              ['title'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      if (widget.emergency.description[index]
                                                  ['imageUrl'] !=
                                              '' &&
                                          widget.emergency.description[index]
                                                  ['imageUrl'] !=
                                              null)
                                        Image.asset(widget.emergency
                                            .description[index]['imageUrl']),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, bottom: 15,left: 15,right: 10),
                                        child: Text(
                                          widget.emergency.description[index]
                                              ['content'],
                                              textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontSize: 15.8,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Container();
                      })),
              if (!learnMore)
                TextButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10))),
                  onPressed: () {
                    setState(() {
                      learnMore = true;
                    });
                  },
                  child: Text(
                    AppLocalizations.of(context)!.learn_more,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              // const SizedBox(
              //   height: 5,
              // ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15))),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                      AppLocalizations.of(context)!
                                          .emergency_services,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Expanded(child: EmergencyServiceNumbers()),
                                ],
                              ),
                            );
                          });
                    },
                    child: Text(
                      AppLocalizations.of(context)!.call_ambulance,
                      style: const TextStyle(fontSize: 18),
                    )),
              ),
              // const SizedBox(
              //   height: 5,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
