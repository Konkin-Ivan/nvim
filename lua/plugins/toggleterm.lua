return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        open_mapping = [[<c-t>]],
        autochdir = true,
        direction =  'float', -- 'vertical' | 'horizontal' | 'tab' | 'float',
        float_opts = {
            border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' |
            title_pos = 'center', -- 'left' | 'center' | 'right',
        },
    }
}