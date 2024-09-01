extension XHeaderMap on Map<String, String> {
  Map<String, String> get toFormHeaders {
    this['Content-Type'] = 'multipart/form-data';
    return this;
  }
}
