// ///
// /// @date: 2022/4/14 12:13
// /// @author: Sensi
// /// @remark:
// ///
// enum Env { sit, dev, prod }
//
// //定义配置信息
// class EnvConfig {
//   final String appName;
//   final String doMain;
//   final String appId;
//
//   EnvConfig(this.appName, this.doMain, this.appId);
// }
//
// class EnvManager {
//   //--dart-define=env=sit
//   static const env = String.fromEnvironment('env');
//
//   static EnvConfig _config() {
//     if (env == Env.sit.name) {
//       return EnvConfig('appSit', "www.xxstudy.cn.sit", '100010');
//     }
//     if (env == Env.dev.name) {
//       return EnvConfig('appDev', "www.xxstudy.cn.dev", '100020');
//     }
//     return EnvConfig('appProd', "www.xxstudy.cn", '100030');
//   }
//
//   static EnvConfig get envConfig => _config();
// }
