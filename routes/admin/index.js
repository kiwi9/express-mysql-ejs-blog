const router = require("express").Router();
const User = require('../../models/User')
const {
  error
} = require('../../libs/error')

// 获取所有用户
router.get("/userManager", async (req, res) => {
  const users = await User.getAll();

  res.send(users)
});

// 新增用户
router.get("/userManager/add", async (req, res) => {
  res.render('admin/addUser', {
    msg: null
  })
});
router.post("/userManager/add", async (req, res) => {
  const {
    username,
    password
  } = req.body;


  try {
    // 添加用户前，先检测是否用户名已经存在
    const check = await User.checkUserName(username)
    if (check) {
      res.render('admin/addUser', {msg: '此用户名已经注册'});
      return;
    }

    const result = await User.addUser({
      username,
      password
    })

    if (result) {
     
      res.render('admin/addUser', {
        msg: '添加成功'
      });
      return;
    }
  } catch (e) {
    console.log(e);
    throw new error('userAddError', "can't add user")
  }

});

// 修改用户
router.get("/userManager/edit", async (req, res) => {
  res.render('editUser')
});
router.post("/userManager/edit", async (req, res) => {
  const users = await User.getAll();

  res.send(users)
});

// 删除用户
router.get("/userManager/del", async (req, res) => {
  const users = await User.getAll();

  res.send(users)
});

module.exports = router;