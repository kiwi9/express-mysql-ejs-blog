const mysql = require("../libs/db");
const md5 = require("../libs/md5")
let db;
const TABLENAME = "users";

(async () => {
  db = await mysql;
})();

module.exports.getAll = async () => {
  return await db.query(`SELECT id,username FROM ${TABLENAME}`);
};
module.exports.addUser = async (user) => {
  const {
    username,
    password
  } = user;
  const result = await db.query(`INSERT INTO ${TABLENAME} (username, password) VALUES (?,?)`, [username, md5(password)]);

  return result.affectedRows > 0 ? true : false;
};
module.exports.updateUser = async (id, user) => {
  const {
    username,
    password
  } = user;
  const result = await db.query(`UPDATE ${TABLENAME} SET username=?, password=? WHERE id=?`, [username, password, id]);
  return result;
};
module.exports.delUser = async (id) => {
  const result = await db.query(`DELETE from ${TABLENAME} where id=?`, [id]);
  return result;
};

module.exports.checkUserName = async (username) => {
  const result = await db.query(`SELECT * FROM ${TABLENAME} WHERE username=?`, [username]);

  return result.length > 0 ? true : false;
};