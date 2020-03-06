const { environment } = require('@rails/webpacker')

const fileLoader = environment.loaders.get('file');
fileLoader.exclude = /\.(test)?(\.js)?$/

module.exports = environment
