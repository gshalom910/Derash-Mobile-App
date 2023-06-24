import 'package:derash/widgets/emergency_service_numbers.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmergencyServices extends StatelessWidget {
  const EmergencyServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.emergency_services),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Container(
            height: 500,
         
           padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            
            color: Color.fromARGB(255, 245, 242, 242),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              Text(
                AppLocalizations.of(context)!.emergency_services,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                AppLocalizations.of(context)!.emergency_services_subtitle,
                style: const TextStyle(
                  fontSize: 21,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Expanded(
                child: EmergencyServiceNumbers(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
