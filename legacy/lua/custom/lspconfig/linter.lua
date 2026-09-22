require('mason-nvim-lint').setup()

-- Linting and formatting
require('lint').linters_by_ft = {
    python = { 'flake8' },
}
