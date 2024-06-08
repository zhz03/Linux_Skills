# How to install Anaconda

## Prerequisite

- ROS needs to install first

## Step-by-step process

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
    Exec=/home/nxp/anaconda3/bin/anaconda-navigator
    Icon=/home/nxp/anaconda3/lib/python3.8/site-packages/anaconda_navigator/static/images/anaconda-icon-256x256.png
    Comment=Open Anaconda Navigator
    Terminal=false
    ```

  - Copy this file to your application folder

    ```
    cp anaconda-navigator.desktop ~/.local/share/applications/
    ```

  - Now you'll see your Anaconda navigator on your application menu/list


- Step 5: conda init for your bash

  - after you run:

    ```
    export PATH=/home/yourusername/anaconda3/bin:$PATH
    ```

  - You can initialize conda in your terminal by running:

    ```
    conda init
    ```

  - It’s recommended that you disable automatic activation of the conda base environment by running:
  
    ```
    conda config --set auto_activate_base false
    ```
  

## How to install miniconda

### Difference between anaconda and miniconda

The main difference between Anaconda and Miniconda lies in their size and the number of pre-installed packages. **Anaconda is larger and comes with a vast array of pre-installed packages, while Miniconda is smaller and only includes Conda and Python**.

### Step-by-step process

**Step1:** Download miniconda installation script:

```
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
```

**Step2:** Install miniconda into specific location

```
sudo bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3
```

This will install miniconda into `/opt/miniconda3`

**Step3:** setup environment path

```shell
export PATH="/opt/miniconda3/bin:$PATH"
```

