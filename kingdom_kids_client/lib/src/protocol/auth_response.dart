/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class AuthResponse
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  AuthResponse._();

  factory AuthResponse() = _AuthResponseImpl;

  factory AuthResponse.fromJson(Map<String, dynamic> jsonSerialization) {
    return AuthResponse();
  }

  /// Returns a shallow copy of this [AuthResponse]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  AuthResponse copyWith();
  @override
  Map<String, dynamic> toJson() {
    return {'__className__': 'AuthResponse'};
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {'__className__': 'AuthResponse'};
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _AuthResponseImpl extends AuthResponse {
  _AuthResponseImpl() : super._();

  /// Returns a shallow copy of this [AuthResponse]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  AuthResponse copyWith() {
    return AuthResponse();
  }
}
