import 'package:derash/widgets/donate_dialogue.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DonateToCc extends StatelessWidget {
  const DonateToCc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.chfe),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Container(
             padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 242, 242),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: ListView(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  AppLocalizations.of(context)!.chfe_title_one,
                  style:
                      const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return const DonateDialogue(amount: 1);
                          });
                    },
                    leading: Image.asset(
                      'assets/images/CCE.png',
                      width: 50,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.donate_one_birr,
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.to_donate,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return const DonateDialogue(amount: 10);
                          });
                    },
                    leading: Image.asset(
                      'assets/images/CCE.png',
                      width: 50,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.donate_ten_birr,
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.to_donate,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return const DonateDialogue(amount: 50);
                          });
                    },
                    leading: Image.asset(
                      'assets/images/CCE.png',
                      width: 50,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.donate_fifty_birr,
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.to_donate,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return const DonateDialogue(amount: 100);
                          });
                    },
                    leading: Image.asset(
                      'assets/images/CCE.png',
                      width: 50,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.donate_hundred_birr,
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.to_donate,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  AppLocalizations.of(context)!.chfe_title_two,
                  style:
                      const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      final Map<String, String> bankAccounts = {
                        'cbe': '100000183906',
                        'dashen': '0041600483011',
                        'awash': '01308236167000',
                        'abay': '1021817336052015',
                        'coop': '1022200034519',
                        'abysinya': '602}63547',
                      };
          
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return SimpleDialog(
                                titlePadding: const EdgeInsets.only(
                                    top: 20, left: 15, right: 15, bottom: 0),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                title: Text(
                                  AppLocalizations.of(context)!.chfe_title_two,
                                  style: const TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                children: [
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * 0.6,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .chfe_bank_subtitle,
                                            style: const TextStyle(
                                              fontSize: 21,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          BankAccountInfo(
                                            accountNumber:
                                                bankAccounts['cbe'].toString(),
                                            iconUrl: 'assets/images/cbe_icon.png',
                                          ),
                                          BankAccountInfo(
                                            accountNumber:
                                                bankAccounts['dashen'].toString(),
                                            iconUrl:
                                                'assets/images/dashen_icon.png',
                                          ),
                                          BankAccountInfo(
                                            accountNumber:
                                                bankAccounts['awash'].toString(),
                                            iconUrl:
                                                'assets/images/awash_icon.png',
                                          ),
                                          BankAccountInfo(
                                            accountNumber:
                                                bankAccounts['abay'].toString(),
                                            iconUrl:
                                                'assets/images/abay_icon.png',
                                          ),
                                          BankAccountInfo(
                                            accountNumber:
                                                bankAccounts['coop'].toString(),
                                            iconUrl:
                                                'assets/images/coop_icon.png',
                                          ),
                                          BankAccountInfo(
                                            accountNumber:
                                                bankAccounts['abysinya']
                                                    .toString(),
                                            iconUrl:
                                                'assets/images/abyssinya_icon.png',
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ]);
                          });
                    },
                    leading: Image.asset(
                      'assets/images/CCE.png',
                      width: 50,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.get_bank_info,
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.bank_info,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return SimpleDialog(
                                titlePadding: const EdgeInsets.only(
                                    top: 20, left: 15, right: 15, bottom: 0),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                title: Text(
                                  AppLocalizations.of(context)!.chfe_title_two,
                                  style: const TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!
                                        .chfe_bank_subtitle,
                                    style: const TextStyle(
                                      fontSize: 21,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                    elevation: 1,
                                    child: ListTile(
                                      onTap: () {},
                                      title: Column(children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Text(
                                          '02311236167000',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .foreign_bank_branch,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .foreign_bank_swift,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                      ]),
                                      leading: Image.asset(
                                        'assets/images/awash_icon.png',
                                        width: 55,
                                      ),
                                    ),
                                  )
                                ]);
                          });
                    },
                    leading: Image.asset(
                      'assets/images/CCE.png',
                      width: 50,
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.foreign_bank_info,
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                    subtitle: Text(
                      AppLocalizations.of(context)!.bank_info,
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class BankAccountInfo extends StatelessWidget {
  final String accountNumber;
  final String iconUrl;
  const BankAccountInfo(
      {Key? key, required this.accountNumber, required this.iconUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        onTap: () {
          Clipboard.setData(ClipboardData(text: accountNumber)).then((value) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              AppLocalizations.of(context)!.chfe_copied,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            )));
          });
        },
        title: Text(
          accountNumber,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          AppLocalizations.of(context)!.to_copy,
          style: const TextStyle(color: Colors.black),
        ),
        leading: Image.asset(
          iconUrl,
          width: 55,
        ),
      ),
    );
  }
}
