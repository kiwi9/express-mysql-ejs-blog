const fs = require("mz/fs");
const pathLib = require("path");
const router = require("express").Router();
const multer = require("multer");
const upload = multer({
  dest: pathLib.resolve(__dirname, "../../public/uploads"),
});
const error = require("../../libs/error").error;
const User = require("../../models/User");

router.get("/", (req, res) => {
  const { username, password } = req.query;
  res.end(username + "," + password);
});

router.post("/", (req, res) => {
  const { username, password } = req.body;

  res.end(username + "," + password);
});

router.post("/upload", upload.any(), async (req, res) => {
  const files = req.files;

  // 重命名上传的文件
  for (let i = 0; i < files.length; i++) {
    const file = files[i];
    const { originalname, path } = file;
    const extname = pathLib.extname(originalname);
    const newName = path + extname;

    try {
      await fs.rename(path, newName);
      console.log(newName, "文件上传成功");
      res.send(newName + "文件上传成功");
    } catch (e) {
      console.error(e);
    }
  }
});

// set cookie
router.get("/set", (req, res) => {
  throw new error("author_error", "user not found");
  // 30秒过期
  res.cookie("name", "tony", { maxAge: 1000 * 30 });
  // 带签名
  res.cookie("job", "fed", { maxAge: 1000 * 30, signed: true });

  res.end("set cookie name, job");
});

// get cookie
router.get("/get", (req, res) => {
  const { name } = req.cookies;
  const { job } = req.signedCookies;

  console.log(req.cookies);
  console.log(req.signedCookies);
  res.end(name + " " + job);
});

router.get("/session", (req, res) => {
  req.session.views = (req.session.views || 0) + 1;

  res.end(req.session.views + "views");
});

router.get("/users", async (req, res) => {
  const users = await User.getAllUsers();
  res.send(users);
});

module.exports = router;
