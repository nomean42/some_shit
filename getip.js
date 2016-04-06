var os = require('os');

//console.log(Object.keys(os.networkInterfaces()));
/**
 * @return {string}
 */
module.exports = function() {
	var interfaces = os.networkInterfaces();
	Object.keys(interfaces).forEach(function(int, i, arr) {
		interfaces[int].forEach(function(addrObj, i, arr) {
			if (addrObj.internal === false && addrObj.family === 'IPv4'){
				console.log(addrObj.address);
				config.samsung.widgetServer = addrObj.address;
				process.env.LOCAL_BUILDER_IP = addrObj.address;
			}
		})
	})
};