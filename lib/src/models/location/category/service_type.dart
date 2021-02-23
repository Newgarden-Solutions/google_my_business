/// A message describing a service type that the business offers
class ServiceType {
  final String serviceTypeId;
  final String displayName;

  ServiceType(this.serviceTypeId, this.displayName);

  ServiceType.fromJson(Map<String, dynamic> json)
      : serviceTypeId = json["serviceType"],
        displayName = json["displayName"];
}
