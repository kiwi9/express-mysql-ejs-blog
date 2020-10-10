const adminRouter = require("./admin");
const webRouter = require("./web");

module.exports = function (app) {
  app.use("/", webRouter);
  app.use("/admin", adminRouter);
};
