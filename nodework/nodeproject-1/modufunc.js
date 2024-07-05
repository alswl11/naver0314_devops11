exports.add = function (a, b) {
  return a + b;
};

exports.check = function (age) {
  if (age >= 20) return "성인";
  else return "미성년자";
};
