# How to install anaconda 

- Step1: go to the anaconda website:  https://www.anaconda.com/products/individual#Downloads

- Step2: Navigate to your Downloads folder and type the follow command: 

```
bash Anaconda3-2020.11-Linux-x86_64.sh
```

- Step3: Now when you try to type the following command to launch anaconda:

```
anaconda-navigator
```

You will get response "command not found"

Use the following command to add the anaconda3 paht to environment:

```
export PATH=/home/yourusername/anaconda3/bin:$PATH
```

Now you can manually launch anaconda-navigator from your terminal

- Step4: Create Anaconda Navigator shortcut/icon. You can check the [website](https://dannyda.com/2020/03/21/how-to-create-shortcut-icon-for-anaconda-anaconda3-navigator-launch-anaconda-navigator-in-linux-debian-ubuntu-kali-linux/). I will put the simplified steps here:

  - Use your terminal and go to your Desktop and create 

    ```
    cd Desktop
    gedit anaconda-navigator.desktop
    ```

  - In your text editor and enter following contents

    Replace zhz03 to your username

    ```
    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Name=Anaconda
    Version=2.0
    Type=Application
    Exec=/home/zhz03/anaconda3/bin/anaconda-navigator
    Icon=/home/zhz03/anaconda3/lib/python3.8/site-packages/anaconda_navigator/static/images/anaconda-icon-256x256.png
    Comment=Open Anaconda Navigator
    Terminal=false
    ```

  - Copy this file to your application folder

    ```
    cp anaconda-navigator.desktop ~/.local/share/applications/
    ```

  - Now you'll see your Anaconda navigator on your application menu/list

    

