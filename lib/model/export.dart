class Export {
  String title;
  int quantity;
  Status status;
  String requester;
  String date;

  Export({
    required this.title,
    required this.quantity,
    required this.status,
    required this.requester,
    required this.date,
  });
}

enum Status { doing, done, expired }
