import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:laptop_harbor/stores/cart.dart';
import 'store.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
void setup() {
  $initGetIt(getIt);
  getIt.registerSingleton<Cart>(Cart());
}