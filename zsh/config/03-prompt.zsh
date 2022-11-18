# `znap prompt` makes your prompt visible in just 15-40ms!
# if [ -x "$(command -v starship)" ]; then
#     znap eval starship 'starship init zsh --print-full-init'
# else
#     znap prompt sindresorhus/pure
# fi

if [ $TERM_PROGRAM != "Apple_Terminal" ]; then
  znap eval oh-my-posh 'oh-my-posh init zsh --config ~/.dotfiles/zsh/theme/andrewmcodes.omp.json'
else
  znap prompt sindresorhus/pure
fi
