const webpack           = require('webpack');
const {resolve}         = require("path");
const ExtractTextPlugin = require("extract-text-webpack-plugin");
const CopyWebpackPlugin = require('copy-webpack-plugin');
const yaml              = require('js-yaml');


module.exports = {
  resolve: {
    extensions: [".webpack.js", ".web.js", ".js", ".jsx", ".sass", ".scss", ".coffee"],
  },
  entry:   [
    "./app/index.js", // the entry point of our app
    "./app/styles/application.sass"
  ],
  output:  {
    path: resolve(__dirname, 'docs'),
    filename: 'app.js'
  },

  devtool: "cheap-module-eval-source-map",

  devServer: {
    contentBase: resolve(__dirname, "dev"), // match the output path
    publicPath:  "/",
    historyApiFallback: true
  },

  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        use:     ["babel-loader"],
        exclude: /node_modules/
      },
      {
        test: /\.coffee/,
        use: ["babel-loader", "coffee-loader"],
        exclude: /node_modules/
      },
      {
        test: /\.(ttf|otf|eot|svg|woff(2)?)(\?[a-z0-9]+)?$/,
        loader: 'file-loader?name=fonts/[name].[ext]'
      },
      {
        test: /\.(sass|scss)/,
        loaders: ExtractTextPlugin.extract(["css-loader", {
          loader: "sass-loader",
          options: {
            includePaths: [
              "node_modules/bourbon/app/assets/stylesheets/",
              "node_modules/bourbon-neat/app/assets/stylesheets/",
              "node_modules/font-awesome/scss/",
              "node_modules/animate.scss/vendor/assets/stylesheets"
            ]
          }
        }])
      },
      {
        test: /\.(jpe?g|png|gif|svg)$/i,
        loaders: [
          'file-loader?hash=sha512&digest=hex&name=[hash].[ext]',
          'image-webpack-loader?bypassOnDebug&optipng.optimizationLevel=7&gifsicle.interlaced=false'
        ]
      }
    ],
  },

  plugins:     [
    new ExtractTextPlugin({
      filename: 'app.css',
      allChunks: true,
    }),
    new CopyWebpackPlugin([
      {from: '**', context: 'app/assets'},
      {from: 'data', to: 'data/[path][name].json', transform: (content, path) => {
        if (/\.ya?ml$/.test(path))
          return JSON.stringify(yaml.safeLoad(content.toString()))
        return content.toString()
      }}
    ])
  ],
  performance: {
    hints: false
  }
};
