mkdir -p "$HOME/local/bin"
curl -o $HOME/.local/bin/errminette https://raw.githubusercontent.com/Poul0s/42-troll/master/errminette
chmod +x $HOME/.local/bin/errminette
echo "alias norminette=\"errminette\"" >> $HOME/.zshrc
source $HOME/.zshrc
