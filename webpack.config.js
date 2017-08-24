const webpack           = require("webpack");
const {resolve}         = require("path");
const ExtractTextPlugin = require("extract-text-webpack-plugin");


module.exports = {
  context: resolve(__dirname, "app"),
  resolve: {
    extensions: [".webpack.js", ".web.js", ".js", ".jsx", ".sass", ".scss", ".coffee"],
  },
  entry:   [
    "react-hot-loader/patch", // activate HMR for React
    "webpack-dev-server/client?http://localhost:8080",// bundle the client for webpack-dev-server and connect to the provided endpoint
    "webpack/hot/only-dev-server", // bundle the client for hot reloading, only- means to only hot reload for successful updates
    "./index.js", // the entry point of our app
    "./styles/application.sass"
  ],
  output:  {
    filename:   "app.js", // the output bundle
    path:       resolve(__dirname, "public"),
    publicPath: "/" // necessary for HMR to know where to load the hot update chunks
  },

  devtool: "inline-source-map",

  devServer: {
    hot:         true, // enable HMR on the server
    contentBase: resolve(__dirname, "public"), // match the output path
    publicPath:  "/" // match the output `publicPath`
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
    new webpack.HotModuleReplacementPlugin(), // enable HMR globally
    new webpack.NamedModulesPlugin(), // prints more readable module names in the browser console on HMR updates

  ],
  performance: {
    hints: false
  }
};
