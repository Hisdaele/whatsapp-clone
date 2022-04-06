class Contact {
  String phoneNumber;
  String name;
  String icon;
  String actus;
  bool isSelected;

  Contact({
    required this.phoneNumber,
    required this.name,
    required this.icon,
    required this.actus,
    this.isSelected = false
  });
}
