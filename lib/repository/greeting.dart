// ignore: non_constant_identifier_names
String Greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  if (hour < 21) {
    return 'Evening';
  }
  return 'Night';
}
