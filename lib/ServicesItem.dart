import 'ServicesModel.dart';

class ServiceModelItem {
  var type;
  String groupName;
  List<ServiceItem> servicesItems = new List();

  ServiceModelItem(var type) {
    this.type = type;
  }
}
