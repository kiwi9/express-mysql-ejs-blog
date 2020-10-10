const mysql = require("../libs/db");
let db;
const TABLENAME = "user_tables";

(async () => {
  db = await mysql;
})();

module.exports.getAllUsers = async () => {
  return await db.query(`SELECT * FROM ${TABLENAME}`);
};
