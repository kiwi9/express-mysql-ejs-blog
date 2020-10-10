const router = require("express").Router();

router.get("/", async (req, res) => {
  res.end("hello admin");
});

module.exports = router;
