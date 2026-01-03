return {
  {
    'ggandor/leap.nvim',
    enabled = true,
    keys = {
      { 's', '<Plug>(leap-forward)', mode = { 'n', 'x', 'o' }, desc = 'Leap forward to' },
      { 'S', '<Plug>(leap-backward)', mode = { 'n', 'x', 'o' }, desc = 'Leap backward to' },
    },
  },
}
