ln -s `pwd`/prompt_command ~/.prompt_command
ln -s `pwd`/bash_colors ~/.bash_colors
ln -s `pwd`/gitprompt ~/gitprompt
ln -s `pwd`/define-colors ~/define-colors
ln -s `pwd`/.bash_functions ~/.bash_functions
ln -s `pwd`/.bash_aliases ~/.bash_aliases

echo "source ~/.bash_aliases" >> ~/.bashrc
echo "source ~/.bash_functions" >> ~/.bashrc
echo "source ~/.bash_colors" >> ~/.bashrc
echo "source ~/.prompt_command" >> ~/.bashrc
echo 'export PROMPT_COMMAND="prompt_command"' >> ~/.bashrc
