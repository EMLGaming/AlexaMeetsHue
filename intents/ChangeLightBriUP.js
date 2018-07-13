const ChangeLightSetting = require("../../ChangeLight.js")
const lib = require('lib');

module.exports = (name = "test", callback) => {
    ChangeLightSetting(JSON.stringify({"bri": 250}), "The brightness is set to high", callback);
};