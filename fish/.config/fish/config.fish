# Disable greeting
set fish_greeting

# Use Neovim as the default text editor
set -x EDITOR "nvim"

alias fishconfig="cd ~/.config/fish && nvim config.fish && cd -"
alias nvimconfig="cd ~/.config/nvim && nvim && cd -"

abbr v "nvim"
abbr c "claude"
abbr oc "opencode"
abbr ws "windsurf"
abbr lg "lazygit"
abbr p "pnpm"
abbr pd "pnpm dev"
abbr pdb "pnpm run db:studio" # Launch Drizzle Studio
abbr px "pnpm dlx"
abbr ns "npm start"
abbr nrs "npm run serve"
abbr nrd "npm run dev"
abbr nrw "npm run watch"
abbr venv "source .venv/bin/activate.fish"
abbr lrr "source venv/bin/activate.fish && litestar run --reload"
abbr gw "gow -e=go,mod,html run ."
abbr gy "git yield"
abbr ghv "gh repo view --web"
abbr pr "gh pr checkout"
abbr prc "gh pr create --web"

# Initialize zoxide
zoxide init fish --cmd j | source
