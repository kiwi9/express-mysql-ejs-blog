const keys = [];
for (let i = 0; i < 100000; i++) {
  keys.push("key_" + Math.random() * 100000);
}

module.exports = {
  secret:
    "fusdifsdjkl@&*()JKLFJKJ:LJLK:J:DFJKLN<MNNV>fds84420&*()%JLNF<D:J:JFD+@!*_u~j</MNNV>",
  keys,
  maxAge: 86400 * 1000, // 一天秒  * 1000毫秒
};
