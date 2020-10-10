const pathLib = require("path");
const express = require("express");
const bodyParser = require("body-parser");
const cookieParser = require("cookie-parser");
const cookieSession = require("cookie-session");
const consolidate = require("consolidate");
const createError = require("http-errors");
const router = require("./routes");
const logger = require("morgan");
const { secret, keys, maxAge } = require("./config");

const app = express();

// logger
app.use(logger("dev"));

// static
app.use(express.static(pathLib.resolve(__dirname, "public")));

// bodyparser 解析post数据
app.use(bodyParser.urlencoded({ extended: false }));

// cookie
app.use(cookieParser(secret));

// session
app.use(
  cookieSession({
    keys,
    maxAge,
  })
);

// engine
app.set("views", pathLib.resolve(__dirname, "views"));
app.set("view engine", "ejs");
app.engine("ejs", consolidate.ejs);

// router
router(app);

// 404
app.use((req, res, next) => {
  next(createError(404));
});

// 异常
app.use((err, req, res, next) => {
  app.locals.message = err.message;
  app.locals.err = app.get("env") === "development" ? err : {};

  res.status(err.status || 500);
  res.render("error");
});

app.listen(3000, () => {
  console.log(`server running @ port : 3000`);
});
