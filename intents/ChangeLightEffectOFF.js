const ChangeLightSetting = require("../../ChangeLight.js")
const lib = require('lib');

module.exports = (name = "test", callback) => {
    ChangeLightSetting(JSON.stringify({"effect": "none"}), "Why did you have to ruin the fun", callback);
};