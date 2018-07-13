const ChangeLightSetting = require("../../ChangeLight.js")
const lib = require('lib');

const colors = {
    red: 0,
    blue: 46920,
    green: 25500,
    pink: 56100,
    yellow: 12750
}

module.exports = (name = "", context, callback) => {
    const color = context.params.color || 'green';
    const chosenColor = colors[color];
    console.log(context.params, chosenColor, color)
    ChangeLightSetting(JSON.stringify({"hue": chosenColor}), `Your lights are now ${color}`, callback);
};
