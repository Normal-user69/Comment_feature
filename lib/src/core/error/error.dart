library error;
import 'package:equatable/equatable.dart';

    class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}

const String SERVER_400_EXCEPTION =
    "Client error occurred. Please check your request.";
const String SERVER_500_EXCEPTION =
    "An error occurred while fetching data from the server.";
const String SERVER_General_EXCEPTION = "Server Side Error";
const String SERVER_404_EXCEPTION = "No Comments Found.";

sealed class Failure extends Equatable {}


class OfflineFaliure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => [SERVER_500_EXCEPTION];
}

class ServerFaliure extends Failure {
  @override
  List<Object?> get props => [SERVER_400_EXCEPTION];
}

class EmptyFaliure extends Failure {
  @override
  List<Object?> get props => [SERVER_404_EXCEPTION];
}


class EmptyException implements Exception {}

class ServerException implements Exception {}

class OfflineException implements Exception {}

    
    