const ChangeLightSetting = require("../../ChangeLight.js")
const lib = require('lib');

module.exports = (name = "test", callback) => {
    ChangeLightSetting(JSON.stringify({"on": false}), "Your lights are turned off", callback);
};