import 'package:bloodpressurelog/utils/app_localization.dart';
import 'package:bloodpressurelog/components/page_sample.dart' as components;
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  createBody(BuildContext context) {
    return ListView(
      children: <Widget>[
        const Center(
            child:
                Image(image: AssetImage('assets/images/icon.png'), width: 250)),
        const SizedBox(height: 20),
        InkWell(
            child: Center(
                child: Text(
                    AppLocalizations.of(context)!.translate("createdBy")! +
                        "Francesco Rossetti",
                    style: const TextStyle(fontSize: 25))),
            onTap: () => launch('https://github.com/francescorossetti')),
        const SizedBox(height: 10),
        FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder:
                (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child: Text(
                        AppLocalizations.of(context)!.translate("version")! +
                            ": " +
                            snapshot.data!.version +
                            "." +
                            snapshot.data!.buildNumber,
                        style: const TextStyle(fontSize: 20)));
              } else {
                return Container();
              }
            }),
        const SizedBox(height: 50),
        InkWell(
          child: Center(
              child: Text(
                  AppLocalizations.of(context)!.translate("privacypolicy")!)),
          onTap: () =>
              launch('https://blood-pressure-log.flycricket.io/privacy.html'),
        ),
        const SizedBox(height: 10),
        InkWell(
          child: Center(
              child: Text(
                  AppLocalizations.of(context)!.translate("termsofservice")!)),
          onTap: () =>
              launch('https://blood-pressure-log.flycricket.io/terms.html'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return components.Page(
        name: "historyValues", showBottomBar: false, body: createBody(context));
  }
}
