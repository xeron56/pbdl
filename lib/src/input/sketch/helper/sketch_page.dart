import 'package:pbdl/src/pbdl/pbdl_page.dart';
import 'package:quick_log/quick_log.dart';
import 'sketch_screen.dart';

class SketchPage {
  var log = Logger('DesignPage');

  String? id;
  String? imageURI;
  String? name;
  bool convert = true;
  List<SketchScreen> screens = [];

  SketchPage({
    this.name,
    this.id,
  }) {
    screens = [];
  }

  void addScreen(SketchScreen item) {
    screens.add(item);
  }

  List<SketchScreen> getPageItems() {
    log.info('We encountered a page that has ${screens.length} page items.');
    return screens;
  }

  /// Parabeac Design File
  Map<String, dynamic> toJSON() {
    var result = <String, dynamic>{};
    result['id'] = id;
    result['name'] = name;
    result['convert'] = convert;

    var tempScreens = <Map>[];
    for (var screen in screens) {
      tempScreens.add(screen.toJson());
    }
    result['screens'] = tempScreens;
    return result;
  }

  factory SketchPage.fromJson(Map<String, dynamic> json) {
    var page = SketchPage(name: json['name'], id: json['id']);
    if (json.containsKey('screens')) {
      (json['screens'] as List?)?.forEach((value) {
        if (value != null && (value['convert'] ?? true)) {
          page.screens
              .add(SketchScreen.fromJson(value as Map<String, dynamic>));
        }
      });
    }
    return page;
  }

  @override
  String CLASS_NAME = 'page';

  Future<PBDLPage> interpretNode() async {
    return Future.value(PBDLPage(
      name: name,
      UUID: id,
      screens:
          await Future.wait(screens.map((e) => e.interpretNode()).toList()),
    ));
  }
}
