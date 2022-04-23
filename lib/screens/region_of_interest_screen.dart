import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micro_gluco_meter/screens/reports_screen.dart';
import 'package:micro_gluco_meter/utils/routes.dart';
import 'package:micro_gluco_meter/widgets/custom_app_bar.dart';
import 'package:micro_gluco_meter/widgets/custom_button.dart';
// import 'package:starflut/starflut.dart';

class RegionOfInterestScreen extends StatefulWidget {
  final RegionOfInterestArguments regionOfInterestArguments;

  const RegionOfInterestScreen({
    Key? key,
    required this.regionOfInterestArguments,
  }) : super(key: key);

  @override
  State<RegionOfInterestScreen> createState() => _RegionOfInterestScreenState();
}

class _RegionOfInterestScreenState extends State<RegionOfInterestScreen> {
  String _platformVersion = 'Unknown';

  // Future<void> initPlatformState() async {
  //   String platformVersion;
  //   try {
  //     StarCoreFactory starcore = await Starflut.getFactory();
  //     StarServiceClass Service =
  //         await starcore.initSimple("test", "123", 0, 0, []);
  //     await starcore.regMsgCallBackP(
  //         (int serviceGroupID, int uMsg, Object wParam, Object lParam) async {
  //       print("$serviceGroupID  $uMsg   $wParam   $lParam");
  //
  //       return null;
  //     });
  //     dynamic SrvGroup = await Service["_ServiceGroup"];
  //
  //     /*---script python--*/
  //     bool isAndroid = await Starflut.isAndroid();
  //     if (isAndroid == true) {
  //       await Starflut.copyFileFromAssets("testcallback.py",
  //           "flutter_assets/starfiles", "flutter_assets/starfiles");
  //       await Starflut.copyFileFromAssets("testpy.py",
  //           "flutter_assets/starfiles", "flutter_assets/starfiles");
  //       await Starflut.copyFileFromAssets("python3.6.zip",
  //           "flutter_assets/starfiles", null); //desRelatePath must be null
  //       await Starflut.copyFileFromAssets("zlib.cpython-36m.so", null, null);
  //       await Starflut.copyFileFromAssets(
  //           "unicodedata.cpython-36m.so", null, null);
  //       await Starflut.loadLibrary("libpython3.6m.so");
  //     }
  //
  //     String docPath = await Starflut.getDocumentPath();
  //     print("docPath = $docPath");
  //     String resPath = await Starflut.getResourcePath();
  //     print("resPath = $resPath");
  //     dynamic rr1 = await SrvGroup.initRaw("python36", Service);
  //
  //     print("initRaw = $rr1");
  //     var Result = await SrvGroup.loadRawModule("python", "",
  //         resPath + "/flutter_assets/starfiles/" + "testpy.py", false);
  //     print("loadRawModule = $Result");
  //     dynamic python = await Service.importRawContext(
  //         "python", "", "contextName", false, "");
  //     print("python = " + await python.getString());
  //     StarObjectClass retobj = await python.call("tt", ["hello ", "world"]);
  //     print(await retobj[0]);
  //     print(await retobj[1]);
  //     print(await python["g1"]);
  //     StarObjectClass yy = await python.call("yy", ["hello ", "world", 123]);
  //     print(await yy.call("__len__", []));
  //     StarObjectClass multiply = await Service.importRawContext(
  //       "python",
  //       "Multiply",
  //       "contextName",
  //       true,
  //       "",
  //     );
  //     StarObjectClass multiply_inst =
  //         await multiply.newObject(["", "", 33, 44]);
  //     print(await multiply_inst.getString());
  //     print(await multiply_inst.call("multiply", [11, 22]));
  //     await SrvGroup.clearService();
  //     await starcore.moduleExit();
  //     platformVersion = 'Python 3.6';
  //   } on PlatformException catch (e) {
  //     print("{$e.message}");
  //     platformVersion = 'Failed to get platform version.';
  //   }
  //
  //   if (!mounted) return;
  //
  //   setState(() {
  //     _platformVersion = platformVersion;
  //   });
  // }

  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback(
    //   (_) => initPlatformState(),
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        appBarText: "Region Of Interest",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(
              widget.regionOfInterestArguments.imageFile,
              width: double.infinity,
              height: 0.3.sh,
              fit: BoxFit.cover,
            ),
            const Text(
              "Original Image",
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 0.05.sh),
            Image.file(
              widget.regionOfInterestArguments.imageFile,
              width: double.infinity,
              height: 0.3.sh,
              fit: BoxFit.cover,
            ),
            const Text(
              "Region Of Interest",
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomButton(
        child: const Text(
          "CONFIRM",
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.reportsScreen,
          (route) => false,
          arguments: ReportsArguments(
            imageFile: widget.regionOfInterestArguments.imageFile,
          ),
        ),
      ),
    );
  }
}

class RegionOfInterestArguments {
  final File imageFile;

  RegionOfInterestArguments({required this.imageFile});
}
