import 'app/boot/app_env.dart';
import 'app/boot/app_boot.dart';

void main() => AppBoot(appEnv: AppEnv.prod).run();