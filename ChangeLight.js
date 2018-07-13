const fetch = require('node-fetch');

module.exports = (setting, text, callback) => {

    fetch(`https://api.meethue.com/bridge/${process.env.username}/groups/2/action`, {
        method: 'PUT', 
            headers: {
            'Authorization': `Bearer ${process.env.accesstoken}`, 
            'Content-Type': 'application/json'
            },
            body: setting
        }).then(() => {
            return callback(null, text);
        });
}