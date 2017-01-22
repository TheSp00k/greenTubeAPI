module.exports = function (book) {
	var request = require('request');
	book.GetFromCloud = function (next) {
		var url = 'https://www.googleapis.com/books/v1/volumes?q=Quantum%20Ph';
		request.get({url: url, json: true}, (err, response, body) => {
			var result = [];
			if (body.items) {
				result = body.items;
			}
			next(err, result);
		});
	};
	book.remoteMethod(
		'GetFromCloud',
		{
			description: 'Get books from google cloud',
			http: { path: '/getfromcloud', verb: 'get' },
			accepts: [],
			returns: { arg: 'books', type: 'array', root: true }
		}
	);
};
