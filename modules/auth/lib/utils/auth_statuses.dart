enum AuthStatuses {
  initial,
  registered,
  notRegistered;

  bool get isRegistered => this == registered;
}
