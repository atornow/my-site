const { merge } = require('webpack-merge');
const common = require('./webpack.common.js');

module.exports = merge(common, {
  mode: 'development',
  devtool: 'inline-source-map',
  devServer: {
    historyApiFallback: true,
    port: 3001,
    hot: true,
    proxy: [
      {
        context: ['/api'],
        target: 'http://localhost:3000'
      }
    ]
  }
});