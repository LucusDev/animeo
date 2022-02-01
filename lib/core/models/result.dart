import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'result.freezed.dart';

@freezed
class Result<E> with _$Result<E> {
  const factory Result.success(E value) = Data<E>;
  const factory Result.error([String? message]) = ErrorDetails;
}
