import 'package:lib_router/config/base_build_config.dart';

///
/// @date: 2022/4/18 09:46
/// @author: Sensi
/// @remark:
///
class BuildConfig implements BaseBuildConfig {
  @override
  String clientId() => '1234';

  @override
  int code() => 0;

  @override
  String redirectUrl() => 'xxstudy.cn';

  @override
  String serverApiKey() => 'xxstudy.cn.key';

  @override
  String serverUrl() => 'xxstudy.cn';
}
