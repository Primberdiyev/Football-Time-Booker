enum AuthStatuses {
  initial,
  registered,
  notRegistered;

  bool get isRegistered => this == registered;

  bool get isNotRegistered => this == notRegistered;
}
