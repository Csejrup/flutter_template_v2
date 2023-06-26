//

import 'package:template/app/app.dart';
import 'package:template/bootstrap.dart';
import 'package:template/core/utils/constants.dart';

void main() {
  bootstrap(() => const App(), environment: Environment.production);
}
