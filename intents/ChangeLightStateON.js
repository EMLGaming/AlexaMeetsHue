const ChangeLightSetting = require("../../ChangeLight.js")
const lib = require('lib');

module.exports = (name = "test", callback) => {
    ChangeLightSetting(JSON.stringify({"on": true}), "Your lights are turned on", callback);
};