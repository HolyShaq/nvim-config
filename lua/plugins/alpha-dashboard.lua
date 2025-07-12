-- Dashboard made with alpha-nvimdash
-- https://github.com/goolord/alpha-nvim

return {
  {
    'goolord/alpha-nvim',
    config = function()
      math.randomseed(os.time())

      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- Function to center quotes
      local function center_quote(quote)
        local max_width = 0
        for _, str in ipairs(quote) do
          max_width = math.max(max_width, #str)
        end

        local centered_strings = {}
        for _, str in ipairs(quote) do
          local leading_spaces = math.floor((max_width - #str) / 2)
          local trailing_spaces = max_width - leading_spaces - #str
          local centered_str = string.rep(' ', leading_spaces) .. str .. string.rep(' ', trailing_spaces)
          table.insert(centered_strings, centered_str)
        end

        -- Insert blank strings at start of table yea ik its scuffed
        table.insert(centered_strings, 1, '')
        table.insert(centered_strings, 1, '')
        return centered_strings
      end

      -- Set header
      dashboard.section.header.val = {
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣿⣄⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⣄⠀⠀⠀⠀⠀⠀⢴⣾⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣟⠛⠛⠛⠛⣻⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣾⣿⣿⣿⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⠀⠀⣼⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡟⢻⣿⣿⣆⠀⠀⠀⠀⠀⠀⢻⣿⣿⣧⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⢀⣤⣶⣿⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣷⣼⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡟⠀⠀⠻⣿⣿⣧⡀⠀⠀⠀⠀⠀⢻⣿⣿⣧⠀⠀⠀⠀⠀',
        '⠀⠀⠀⣀⣤⣾⣿⣿⣿⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⠏⠀⠀⠀⠀⠙⣿⣿⣷⡀⠀⠀⠀⠀⠀⠹⣿⣿⣷⡀⠀⠀⠀',
        '⠀⠀⠀⠙⣿⣿⣿⡍⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⡄⠀⠀⠀⠀⠀⠙⣿⣿⣷⡀⠀⠀⠀⠀⢠⣾⣿⣿⠃⠀⠀⠀',
        '⠀⠀⠀⠀⠈⢿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⢿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣄⠀⠀⠀⠀⠀⠘⢿⣿⣿⣄⠀⠀⣠⣿⣿⡿⠁⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⡿⠁⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⠀⠀⠀⠀⠀⠈⢿⣿⣿⣆⣰⣿⣿⡿⠁⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⡟⠁⠀⠀⠈⢻⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢼⣿⣿⡟⠀⠀⠀⠀⠀⠀⢻⣿⣿⡧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⡧⠀⠀⠀⠀⠀⠀⢻⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀',
        '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠋⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠹⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀',
        '',
        '',
      }

      local quotes = {
        {
          'The universe is, and we are.',
          "I'm ready.",
        },
        {
          'Science compels us to',
          'explode the sun!',
        },
        {
          'This song is new to me,',
          'but I am honored to be a part of pt.',
        },
        {
          'Mallow, my better 50 percent!',
        },
        {
          'Yarrow, stop using this board',
          'to flirt with my sister.',
        },
        {
          'Ship log updated.',
        },
        {
          'Fear of failure is',
          'a poor reason not to try.',
        },
        {
          'Our curiosity goes with you on your journey.',
          'You walk in the footsteps of those who came before you,',
          'and your path guides those who will follow later.',
        },
        {
          'Foli, are you still here?',
          'I am unsure how to survive in this place without you.',
          '(I am unsure of how to be me without you.)',
        },
        {
          'The future is always built on the past,',
          "even if we won't get to see it.",
        },
        {
          'Is the hardest part of this tragedy not knowing who we may have lost?',
          'Or will the hardest part come later, when we learn?',
          '(Be well, Aunt Melorae...)',
        },
        {
          '- Imagine if there were two volcanic moons.',
          '- Hypothesis: There can exist too much lava.',
          '- I’d strongly prefer we test the null hypothesis.',
        },
        {
          'When you reach the Quantum Moon,',
          'recall these Nomai,',
          'and carry their curiosity onward with you.',
        },
        {
          'As a child, I considered such unknowns sinister.',
          'Now, though, I understand they bear no ill will.',
          'The universe is, and we are.',
          "I'm ready.",
        },
        {
          'The stars were beautiful, weren’t they?',
          'Even if our star is what ultimately killed us.',
          'I’ll wait here and remember them while you gather everybody.',
        },
        {
          'It’s tempting to linger in this moment,',
          'while every possibility still exists.',
          'But unless they are collapsed by an observer,',
          'they will never be more than possibilities.',
        },
        {
          'Are you certain you want to remember me?',
        },
        {
          'Every decision is made in darkness.',
          'Only by making a choice can we learn whether it was right or not.',
        },
        {
          'It’s the kind of thing that makes you glad you stopped',
          'and smelled the pine trees along the way, you know?',
        },
        {
          'Then it’s time!',
          'Time to send our spark out into the darkness.',
        },
        {
          'Come, sit with me, my fellow traveler.',
          'Let’s sit together and watch the stars die.',
        },
        {
          'Is sending a being’s memories back in time',
          'the same as sending the being itself back in time?',
        },
      }

      -- Set random quote
      dashboard.section.footer.val = center_quote(quotes[math.random(#quotes)])

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button('f', '  > Find file', ':Telescope find_files<CR>'),
        dashboard.button('s', '  > Settings', ':Oil --float C:/Users/Lenovo/AppData/Local/nvim<CR>'),
        dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
      }

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd [[
          autocmd FileType alpha setlocal nofoldenable
      ]]

      -- Keymap
      -- Open dashboard
      vim.api.nvim_set_keymap('n', '<leader>hh', ':Alpha<CR>', { noremap = true, silent = true })
    end,
  },
}
