mkdir -p "$HOME/local/bin"
curl -o ~/.local/bin/errminette https://raw.githubusercontent.com/Poul0s/42-troll/master/errminette
echo "alias norminette=\"errminette\"" >> $HOME/.zshrc
