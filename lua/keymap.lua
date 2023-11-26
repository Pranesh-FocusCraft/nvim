-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local mapn = vim.keymap.set


-- map('n','<Right>','<Nop>')                                     -- disable right click ( I think )

-- reload config
map("n", "<leader>r", ":source ~/AppData/Local/nvim/init.lua<CR>") -- reload neovim config

-- Tab bindings
-- map("n", "<leader>t", ":tabnew<CR>")			                      -- space+t creates new tab
-- map("n", "<leader>x", ":tabclose<CR>")		                      -- space+x closes current tab
-- map("n", "<leader>j", ":tabprevious<CR>")	                    -- space+j moves to previous tab
-- map("n", "<leader>k", ":tabnext<CR>")			                    -- space+k moves to next tab

-- -- easy split generation
-- map("n", "<leader>v", ":vsplit")				                        -- space+v creates a veritcal split
-- map("n", "<leader>s", ":split")					                      -- space+s creates a horizontal split

-- -- easy split navigation
-- map("n", "<C-h>", "<C-w>h")						                        -- control+h switches to left split
-- map("n", "<C-l>", "<C-w>l")						                        -- control+l switches to right split
-- map("n", "<C-j>", "<C-w>j")						                        -- control+j switches to bottom split
-- map("n", "<C-k>", "<C-w>k")						                        -- control+k switches to top split

-- -- buffer navigation
-- map("n", "<Tab>", ":bnext <CR>")				                        -- Tab goes to next buffer
-- map("n", "<S-Tab>", ":bprevious <CR>")	                        -- Shift+Tab goes to previous buffer
-- map("n", "<leader>d", ":bd! <CR>")			                        -- Space+d delets current buffer

-- -- adjust split sizes easier
-- map("n", "<C-Left>", ":vertical resize +3<CR>")		            -- Control+Left resizes vertical split +
-- map("n", "<C-Right>", ":vertical resize -3<CR>")	              -- Control+Right resizes vertical split -

-- -- Open netrw in 20% split in tree view
mapn("n", "<leader>e", ":20Lex<CR>", { silent = true }) -- space+e toggles netrw tree view

-- -- Automatically create if, case, and function templates
-- map("n", "<leader>i", "iif [ @ ]; then <CR><CR> else <CR><CR> fi <ESC>/@ <CR>")
-- map("n", "<leader>c", "icase \"$@\" in <CR><CR> @)   <CR>;; <CR><CR> esac <ESC>5kI<ESC>/@<CR>")
-- map("n", "<leader>f", "i@() {<CR><CR> } <ESC>2kI<ESC>/@<CR>")

-- -- Easy way to get back to normal mode from home row
-- map("i", "kj", "<Esc>")					                              -- kj simulates ESC
-- map("i", "jk", "<Esc>")					                              -- jk simulates ESC

-- Automatically close brackets, parethesis, and quotes
map("i", "'", "''<left>")
map("i", "\"", "\"\"<left>")
map("i", "(", "()<left>")
map("i", "[", "[]<left>")
map("i", "{", "{}<left>")
map("i", "{;", "{};<left><left>")
map("i", "/*", "/**/<left><left>")

-- -- Automatically create if, case, and function templates in insert mode
-- map("i", ",i", "if [ @ ]; then <CR><CR> else <CR><CR> fi ")
-- map("i", ",c", "case \"$@\" in <CR><CR> @)    ;; <CR><CR> esac")
-- map("i", ",f", "@() {<CR><CR> } ")

-- Visual Maps
-- map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")			   -- Replace all instances of highlighted words
-- map("v", "<C-s>", ":sort<CR>")									               -- Sort highlighted text in visual mode with Control+S
map("v", "J", ":m '>+1<CR>gv=gv") -- Move current line down
map("v", "K", ":m '>-2<CR>gv=gv") -- Move current line up


-- My config
mapn("n", "<leader>q", ":q<CR>", { silent = true })    -- quit editor
mapn("n", "<leader>l", ":Lazy<CR>", { silent = true }) -- open lazy UI


-- from lazyvim config

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
