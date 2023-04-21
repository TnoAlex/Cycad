import data_rdb from '@ohos.data.rdb'
import log from '../common/cycadLog'

const DB_NAME = { 'name': 'CycadDB' }

export default class Rdb {
  private rdbStore: any = null
  private tableName: string
  private sqlCreateTable: string
  private columns: Array<string>

  constructor(tableName: string, sqlCreateTable: string, columns: Array<string>) {
    this.tableName = tableName;
    this.sqlCreateTable = sqlCreateTable;
    this.columns = columns;
  }

  /* Init */
  getRdbStore(callback) {
    if (!callback || typeof callback == 'undefined' || callback == undefined) {
      log.error('getRdbStore() has no callback!');
      return;
    }
    if (this.rdbStore != null) {
      log.info('The rdbStore exists.');
      callback();
      return;
    }
    let context = getContext(this);
    data_rdb.getRdbStore(context, DB_NAME, 1, (err, rdb) => {
      if (err) {
        log.error('gerRdbStore() failed, err: ' + err);
        return;
      }
      this.rdbStore = rdb;
      this.rdbStore.executeSql(this.sqlCreateTable);
      log.info('getRdbStore() finished.');
      callback();
    });
  }

  /**
   * insert data
   *
   * @param data
   * @param callback
   */
  insertData(data, callback) {
    if (!callback || typeof callback == 'undefined' || callback == undefined) {
      log.error('insertData() has no callback!');
      return;
    }
    let resFlag: boolean = false;
    const valueBucket = data;
    this.rdbStore.insert(this.tableName, valueBucket, function (err, ret) {
      if (err) {
        log.error('insertData() failed, err: ' + err);
        callback(resFlag);
        return;
      }
      log.info('insertData() finished: ' + ret);
      callback(!resFlag);
    });
  }

  /**
   * delete data
   *
   * @param predicates
   * @param callback
   */
  deleteData(predicates, callback) {
    if (!callback || typeof callback == 'undefined' || callback == undefined) {
      log.error('deleteData() has no callback!');
      return;
    }
    let resFlag: boolean = false;
    this.rdbStore.delete(predicates, function (err, ret) {
      if (err) {
        log.error('deleteData() failed, err: ' + err);
        callback(resFlag);
        return;
      }
      log.info('deleteData() finished: ' + ret);
      callback(!resFlag);
    });
  }

  /**
   * update data
   *
   * @param predicates
   * @param data
   * @param callback
   */
  updateData(predicates, data, callback) {
    if (!callback || typeof callback == 'undefined' || callback == undefined) {
      log.error('updateDate() has no callback!');
      return;
    }
    let resFlag: boolean = false;
    const valueBucket = data;
    this.rdbStore.update(valueBucket, predicates, function (err, ret) {
      if (err) {
        log.error('updateData() failed, err: ' + err);
        callback(resFlag);
        return;
      }
      log.info('updateData() finished: ' + ret);
      callback(!resFlag);
    });
  }

  /**
   * query data
   *
   * @param predicates
   * @param callback
   */
  query(predicates, callback) {
    if (!callback || typeof callback == 'undefined' || callback == undefined) {
      log.error('query() has no callback!');
      return;
    }
    this.rdbStore.query(predicates, this.columns, function (err, resultSet) {
      if (err) {
        log.error('query() failed, err: ' + err);
        return;
      }
      log.info('query() finished.');
      callback(resultSet);
      resultSet.close();
    });
  }
}