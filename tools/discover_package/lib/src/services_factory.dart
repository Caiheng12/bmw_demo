part of discover_package;

class ServicesFactory {

  convertToServiceModel(ServiceModel serviceModel) {
    List<ServiceModelItem> serviceModelItems = new List();
    if (serviceModel != null &&
        serviceModel.services != null &&
        serviceModel.services.serviceConfigurations != null &&
        serviceModel.services.serviceConfigurations.length > 0 &&
        serviceModel.services.serviceConfigurations[0].value != null &&
        serviceModel.services.serviceConfigurations[0].value.length > 0) {
      for (var value in serviceModel.services.serviceConfigurations[0].value) {
        if (value.services != null && value.services.length > 0) {
          var serviceModelItem = new ServiceModelItem(  1);
          serviceModelItems.add(serviceModelItem);
          serviceModelItem.groupName = value.groupName;
          for (var i = 0; i < value.services.length;) {
            var serviceModelItem = new ServiceModelItem(2);
            serviceModelItems.add(serviceModelItem);
            if (i < value.services.length) {
              serviceModelItem.servicesItems.add(value.services[i]);
              ++i;
            } else {
              break;
            }
            if (i < value.services.length) {
              serviceModelItem.servicesItems.add(value.services[i]);
              ++i;
            } else {
              break;
            }
            if (i < value.services.length) {
              serviceModelItem.servicesItems.add(value.services[i]);
              ++i;
            } else {
              break;
            }
          }
        }
      }
    }
    return serviceModelItems;
  }
}
