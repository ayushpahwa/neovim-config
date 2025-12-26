return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  init = function()
    vim.cmd "let test#strategy='vimux'"

    -- Determine the correct test runner based on project
    local cwd = vim.fn.getcwd()

    -- Lab test configuration (for woocommerce-connect-server)
    if cwd:match "woocommerce%-connect%-server" then
      vim.cmd [[
        let test#javascript#lab#executable = 'npm run lab -P'
        let test#javascript#runner = 'lab'
        let test#javascript#lab#file_pattern = '\v(test|spec)\.(js|jsx|ts|tsx)$'
      ]]
    else
      -- Jest configuration for other projects
      vim.cmd [[
        let test#javascript#jest#executable = 'pnpm run test:unit --'
        let test#javascript#runner = 'jest'
        let test#javascript#jest#file_pattern = '\v(test|spec)\.(js|jsx|ts|tsx)$'
      ]]
    end

    -- PHP/PHPUnit configuration for WooCommerce
    vim.cmd [[
          let test#php#phpunit#executable = 'pnpm run test:php:env --'
          let test#php#phpunit#options = '--filter'
          let test#php#runner = 'phpunit'
          let test#php#phpunit#file_pattern = '\v(test|Test|tests)\.php$'
      ]]

    -- Custom command for WooCommerce PHP tests
    vim.cmd [[
          function! WooCommerceTransform(cmd) abort
            " Only transform PHP test commands
            if a:cmd !~# '\.php'
              return a:cmd
            endif

            " Extract the test class name from the file path
            let l:test_file = substitute(a:cmd, '.*--filter \(.*\)\.php.*', '\1.php', '')
            let l:class_name = substitute(l:test_file, '.*/\(.*\)\.php', '\1', '')

            " Handle different test file naming patterns
            if l:class_name =~# '^class-.*-tests$'
              " Convert class-wc-rest-shipping-zones-v4-controller-tests to WC_REST_Shipping_Zones_V4_Controller_Tests
              let l:class_name = substitute(l:class_name, '^class-', '', '')
              let l:class_name = substitute(l:class_name, '-tests$', '', '')
              let l:class_name = substitute(l:class_name, '-', '_', 'g')
              let l:class_name = substitute(l:class_name, '\<\(\w\)\(\w*\)\>', '\u\1\2', 'g')
              let l:class_name = l:class_name . '_Tests'
            endif

            " Return the command with the correct class name
            return 'pnpm run test:php:env -- --filter ' . l:class_name
          endfunction

          let g:test#custom_transformations = {'woocommerce': function('WooCommerceTransform')}
          let g:test#transformation = 'woocommerce'
      ]]
  end,
  keys = {
    {
      "<leader>tn",
      ":TestNearest<Return>",
      silent = true,
      noremap = true,
      desc = "Run the nearest test func",
    },
    {
      "<leader>tf",
      ":TestFile<Return>",
      silent = true,
      noremap = true,
      desc = "Run the whole test file",
    },
    {
      "<leader>ts",
      ":TestSuite<Return>",
      silent = true,
      noremap = true,
      desc = "Run the full test suite",
    },
    {
      "<leader>tl",
      ":TestLast<Return>",
      silent = true,
      noremap = true,
      desc = "Run the last test",
    },
    {
      "<leader>tg",
      ":TestVisit<Return>",
      silent = true,
      noremap = true,
      desc = "View the test results",
    },
  },
}
