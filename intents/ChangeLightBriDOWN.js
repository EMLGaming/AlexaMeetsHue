const ChangeLightSetting = require("../../ChangeLight.js")
const lib = require('lib');

module.exports = (name = "test", callback) => {
    ChangeLightSetting(JSON.stringify({"bri": 125}), "The lights are dimmed", callback);
};