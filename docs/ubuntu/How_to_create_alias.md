# How to create a alias for commands

## Steps to create a permanent Bash alias:

Open the Terminal app and then type the following commands:

1. Edit the ~/.bash_aliases or ~/.bashrc (recommended) file using a text editor:
   `vi ~/.bash_aliases# or #nano ~/.bashrc`

2. Append your bash alias

3. For example append:

   ```
   alias update='sudo apt update'
   alias open='nautilus'
   ```

   where,

   - update is your command alias

4. Save and close the file.

5. Activate alias by typing the following [source command](https://bash.cyberciti.biz/guide/Source_command?utm_source=Linux_Unix_Command&utm_medium=faq&utm_campaign=nixcmd):
   `source ~/.bash_aliases`

**WARNING!** 

Please note that ~/.bash_aliases file only works if the following line presents in the ~/.bashrc file:

```
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi
```

Are above lines are missing in your ~/.bashrc file? Just append at the end of the ~/.bashrc, using a text editor such as vi/vim or joe. See [~/.bash_aliases](https://bash.cyberciti.biz/guide/~/.bash_aliases) wiki page for more info.