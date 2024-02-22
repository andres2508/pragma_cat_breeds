class PrinterException implements Exception {
  final String message;

  PrinterException({required this.message});

  PrinterException.of(this.message);

  @override
  String toString() => message;

  factory PrinterException.from(String btAddress, String error) {
    print("Printer error, MAC: $btAddress");
    print("Printer error, Error: $error");
    return PrinterException.of(error);
  }
}
