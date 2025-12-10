return {
  {
    'benlubas/molten-nvim',
    version = '^1.0.0', -- use version <2.0.0 to avoid breaking changes
    build = ':UpdateRemotePlugins',
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = 'none'
      vim.g.molten_output_win_max_height = 20
    end,

    config = function()
      local map = vim.keymap.set

      map('n', '<localleader>mi', ':MoltenInit<CR>', { silent = true, desc = 'Molten: Initialize' })

      map('n', '<localleader>e', ':MoltenEvaluateOperator<CR>', { silent = true, desc = 'Molten: Evaluate Operator' })

      map('n', '<localleader>rl', ':MoltenEvaluateLine<CR>', { silent = true, desc = 'Molten: Evaluate Line' })

      map('n', '<localleader>rr', ':MoltenReevaluateCell<CR>', { silent = true, desc = 'Molten: Re-evaluate Cell' })

      map('v', '<localleader>r', ':<C-u>MoltenEvaluateVisual<CR>gv', { silent = true, desc = 'Molten: Evaluate Visual' })

      map('n', '<localleader>rd', ':MoltenDelete<CR>', { silent = true, desc = 'Molten: Delete Cell' })

      map('n', '<localleader>oh', ':MoltenHideOutput<CR>', { silent = true, desc = 'Molten: Hide Output' })

      map('n', '<localleader>os', ':noautocmd MoltenEnterOutput<CR>', { silent = true, desc = 'Molten: Enter Output' })
    end,
  },
}
