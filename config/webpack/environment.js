const { environment } = require('@rails/webpacker')

module.exports = environment

// config/webpack/environment.js に記述を追記 

const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)