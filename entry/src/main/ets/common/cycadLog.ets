import hilog from '@ohos.hilog';

export default class log {
  constructor() {
    hilog.isLoggable(0x0000, 'testTag', hilog.LogLevel.DEBUG)
  }

  static info(msg: string) {
    hilog.info(0x0000, 'testTag', '%{public}s', msg)
  }

  static debug(msg: string) {
    hilog.debug(0x0000, 'testTag', '%{public}s', msg)
  }

  static error(msg: string) {
    hilog.error(0x0000, 'testTag', '%{public}s', msg)
  }

  static warn(msg: string) {
    hilog.warn(0x0000, 'testTag', '%{public}s', msg)
  }
}