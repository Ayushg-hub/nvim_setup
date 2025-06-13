import platform
import subprocess
import os
import shutil
from term_color import color
from pathlib import Path

#set package managers accoring to the platform
pm = None
inst_cmd = None
sys = platform.system()
if sys == 'Darwin':
    pm = 'brew'
    inst_cmd = 'install'
elif sys == 'win':
    pm = 'winget'
    inst_cmd = 'install'

deps = [
    "git",
    "curl"
]

#install dependencies
for dep in deps:
    #check if the package is already installed
    ret = subprocess.run(['which',dep],capture_output=True)
    if ret.returncode == 0:
        print(f"package {color.green(dep)} already installed.")
    else:
        ret = subprocess.run([pm,inst_cmd,dep])

#install nerdfont


#install neovim
#for mac just use brew
if subprocess.run(['which','nvim'],capture_output=True).returncode == 0:
    print(f"{color.green('neovim')} already installed.")
else:
    ret = subprocess.run([pm,inst_cmd,'neovim'])

home = Path.home()

#put the init.vim file in the correct location
config_dir = home / ".config/nvim"
if not os.path.exists(config_dir):
    os.makedirs(config_dir)
shutil.copy('./init.lua',config_dir)
shutil.copytree('./lua',config_dir/"lua", dirs_exist_ok=True)
print(f"{color.green('vim config')} installed")

