import 'app/runner/app_env.dart';
import 'app/runner/app_runner.dart';

void main() => AppRunner(appEnv: AppEnv.prod).run();