
import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable{
  @override
  List<Object> get props => throw UnimplementedError();

}

class UnKnown extends AuthState
{
  @override
  List<Object> get props => [];
}