let calc = {};
calc.mul = function (a, b) {
  return a * b;
};

calc.grade = function (score) {
  return score >= 90
    ? "A"
    : score >= 80
    ? "B"
    : score >= 70
    ? "C"
    : score >= 60
    ? "D"
    : "F";
};

module.exports = calc;
