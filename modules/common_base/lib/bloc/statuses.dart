enum Statuses {
  initial,
  error,
  loading,
  success;

  bool get isLoading => this == loading;

  bool get isError => this == error;

  bool get isSuccess => this == success;
}
