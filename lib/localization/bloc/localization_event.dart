abstract class LocalizationEvent {}

class LocalizationChange extends LocalizationEvent {
  final String tabIndex;
  var con;

  LocalizationChange({required this.tabIndex, required this.con});
}
