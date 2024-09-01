import 'api_base.dart';

// Websocket Url
const socketUrl = 'localhost';
const sPort = 5000;

// Authentication Endpoints
final refreshTokenUrl = '$baseUrl/auth/user/regenerate-access-token';

final initResetUrl = '$baseUrl/auth/user/reset-password';
final verifyResetTokenUrl = '$baseUrl/auth/user/verify-reset-token';
final setNewPasswordUrl = '$baseUrl/auth/user/reset-password/new';

final verifyUrl = '$baseUrl/auth/user/create/verify';
final registerUrl = '$baseUrl/auth/user/create';
final loginUrl = '$baseUrl/auth/user/login';

// User
final addPasswordUrl = '$baseUrl/user/add-password';

// Shop & Products
final getHomeProductsUrl = '$baseUrl/product/home';

// File Management Endpoints
final fileUrl = '$baseUrl/files';
