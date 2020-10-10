module.exports = {
  error: function (code, message) {
    this.code = code || "internal:unknown error";
    this.message = message || "";
  },
};
