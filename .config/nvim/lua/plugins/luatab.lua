return {
  'alvarosevilla95/luatab.nvim',
  requires = 'kyazdani42/nvim-web-devicons',
  event    = "VeryLazy",
  config   = function()
    require('luatab').setup {}
  end
}
