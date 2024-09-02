enum ErrorTypes {
  data,
  server,
  secket,
  handshake,
  socket,
  format,
  timeout,
  unknown
}

enum SupportState {
  unknown,
  supported,
  unsupported,
  authenticating,
  authenticated,
  error
}

enum Arrangements { topToBottom, bottomToTop, leftToRight, rightToLeft }

enum ApiStatus { success, failed }

enum Environment { development, production }

enum AppButtonType { primary, secondary, outline, text }

enum AppState { success, loading, failed, info }

enum TextFieldType { password, address }

enum TextFiledDecorationType { normal, filled }

enum SeverityLevel { info, warning, critical }

enum Alert { error, warning, info }

enum DialogPosition { top, bottom, center }

enum FieldType { text, area, dob, phone, number, gender, customOption }

enum Positions { before, after, leading, extended }

enum ImageType { svg, png }
