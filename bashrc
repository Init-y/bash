# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globsta

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

DEV_TOOLS="/opt/DevTools"
JAVA_HOME="$DEV_TOOLS/JDK/jdk8u282-b08"
ANDROID_HOME="$DEV_TOOLS/Android"
FLUTTER_HOME="$DEV_TOOLS/Flutter"
export JAVA_HOME
export ANDROID_HOME
PATH="$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/tools/bin:$ANDROID_HOME/platform-tools:$FLUTTER_HOME/bin:$PATH" 

PS1="\[$(tput bold)\]\[\033[38;5;166m\]\u\[$(tput sgr0)\]\[\033[38;5;56m\]@\[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;160m\]\h\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;97m\]( \[$(tput sgr0)\]\w\[$(tput sgr0)\]\[\033[38;5;97m\] )\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;172m\]{\[$(tput sgr0)\]\n\[$(tput sgr0)\]\[\033[38;5;190m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ceo/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ceo/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ceo/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ceo/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



#. ./.bash/script.sh

#
function ceo() {
    echo -e "Name: ${amber}Ceo${nc}";
    echo -e "E-mail: ${amber}noah.kd@gmail.com${nc}";
}

function lyh() {
    echo -e "Name: ${amber}Lyh${nc}";
    echo -e "E-mail: ${amber}noely.gangello@gmail.com${nc}";
}

# =======================================================================================================
#                bash
# =======================================================================================================

function ..() {
    cd ..;
    echo back one step;
}

function c() {
    echo clearing;
    clear;
}

function js() {
    node $1;
}

function nbash() {
    nano ~/.bashrc;
}

function kbash() {
    kak ~/.bashrc;
}

function gbash() {
    gedit ~/.bashrc;
}



#	[ Git ]
# ======================================== #

#. .bash/gsuite;
#. .bash/colors;



#	[ Colors ]
# ======================================== #
colorsV="Colors";

black="\e[30m";
red="\e[31m";
green="\e[32m";
yellow="\e[33m";
blue="\e[34m";
magenta="\e[35m";
cyan="\e[36m";
lgray="\e[37m";
gray="\e[90m";
lred="\e[91m";
lgreen="\e[92m";
lyellow="\e[93m";
lblue="\e[94m";
lmagenta="\e[95m";
lcyan="\e[96m";
white="\e[97m";

amber="\e[38;5;166m";
cred="\e[38;5;160m";

nc="\e[0m";



#	[ Git ]
# ======================================== #

function gity() {
	git init $1;
	cd $1;
	code .;
	exit;
}

function glone() {
	git clone $1;
	cd $1;
}

function clone() {
	http="https://github.com/";
	git clone $http$1;
}

function remote-r {
    git remote rename origin github;
}

function addGithub() {
    git remote add github https://github.com/$1/$2;
    git branch -M root;
    git push -u github root;
    echo -e "${red}GitHub repo added for $2 ${nc}";
    echo -e "${lred}https://github.com/$1/$2 ${nc}";
}

function addOrigin() {
    git remote add origin https://github.com/$1/$2;
    git branch -M root;
    git push -u origin root;
    echo -e "${red}GitHub repo added for $2 ${nc}";
    echo -e "${lred}https://github.com/$1/$2 ${nc}";
}

function add() {
    git add $1;
}

function commit() {
	git add .;
	git commit -m "Ceo - $(date -d @$(date -u +%s))";
}

function fetch {
    git fetch;
}

function pull() {
    echo -e "${lblue}Pulling Github${nc}";
    git fetch;
    sleep 3s;
    git pull;
}

function push() {
    if [ !$1 ]; then
			git add .;
			git commit -m "Ceo - $(date -d @$(date -u +%s))";
			git push;
    elif [ $1 = "-u" ]; then
        git push -u github $2;
    fi
}

function branch() {
    git switch -c $1;
    echo -e "${blue}Branch $1 initialized ${nc}";
}

function send2 {
    git push -u github $1;
}

function switch {
    git switch $1;
}

function branches() {
    git branch -a;
    echo -e "${blue}Branch trees ${nc}";
}

function merge {
    git merge;
}

function origin-r {
    git remote rename origin $1;
    echo git remote name:;
    echo -e "${amber} git remote";
}

function g-suite() {
    echo -e "${blue}======================================";
    echo -e "${lred}        [ G  I  T  H  U  B ]";
    echo -e "${blue}====================================== ";
    echo ;
    echo -e "${lred}=========== [ init confs ] ===========";
    echo ;
    echo -e "${lyellow}= [ logout user credentials from terminal ] ="
    echo -e "${lyellow}=== check windows credential manager and ${nc}" 
    echo "delete the github entry under:"
    echo "  > control panel" 
    echo "  > user accounts" 
    echo "  > credential manager" 
    echo "  > Windows credentials" 
    echo "  > Generic credentials"
    echo
    echo "git config --global --unset user.name"
    echo "git config --global --unset user.email"
    echo "git config --global --unset credential.helper"
    echo
    echo -e "${lyellow}=== [ set username for GitHub ] ===${nc}"
    echo 'git config --global user.name "Nome"';
    echo 'git config --global user.email "email@email.com"';
    echo 'git config --global user.password ""';
    echo "git config --global credential.helper store";
    echo
    echo -e "${lyellow}colored git terminal${nc}"
    echo "git config --global color.ui auto";
    echo
    echo "git config --list";
    echo 'git config --global core.editor "code --wait"';
    echo "git config --global -e";
    echo
    echo "git config --global alias.s status"
    echo 
}

function branch-suite() {
    echo -e "${lred}======================================";
    echo -e "${lblue}       [ Working With Branches ]";
    echo -e "${lred}======================================";
    echo ;
    echo -e "${lred}>${green}  lists all local and remote branches ${nc}";
    echo "      git branch -a";
    echo -e "${lred}>${green}  lists all local ${nc}";
    echo "      git branch";
    echo -e "${lred}>${green}  Switching between branches ${nc}"
    echo "      git switch novaBranch"
    echo -e "${lred}>${green}  Switchs back 2 previous branch ${nc}"
    echo "      git switch -"
    echo -e "${lred}>${green}  old way to create branches ${nc}";
    echo '      git checkout -b "novaBranch"';
    echo -e "${lred}>${green}  alternate between branches ${nc}"
    echo "      git checkout main"
    echo ;
    echo -e "${lred}>${green}  upload first commit to a specific branch ${nc}"
    echo "      git push -u origin novaBranch"
    echo ;
    echo -e "${lred}>${lblue}   Mergin branches ${nc}"
    echo -e "${lred} ----------------------- ${nc}"
    echo -e "${lblue}   1 - ${gray}entrar na branch main ${nc}"
    echo "       git switch main"
    echo -e "${lblue}   2 - ${gray}fazer a mesclagem ${nc}"
    echo "       git merge novaBranch"
    echo -e "${lblue}   3 - ${gray}depois de mesclar não precisa commitar, só precisa fazer push, pois os commits já foram feitos nas branches mescladas ${nc}"
    echo "       git add .";
    echo "       git push"
    echo ;
    echo -e "${lred}>${lblue}  Deleting branches"
    echo -e "${lred} ----------------------- ${nc}"
    echo -e "${lred}>${green}   Delete a local branch ${nc}"
    echo "      git branch -d novaBranch"
    echo -e "${lred}>${green}   Delete a remote branch ${nc}"
    echo "      git push origin --delete novaBranch"
    echo -e "${gray}      or ${nc}"
    echo "      git push origin :novaBranch"
    echo ;
    echo -e "${lred}>${green}   Undo trashes N pair with remote ${nc}"
    echo "      git reset --hard origin/main"
    echo ;
    echo -e "${lred}>${green}   Download N track all remote branches ${nc}"
    echo '      git branch -r | grep -v "\->" | while read remote; do git branch --track "${remote#origin/}" "$remote"; done'
    echo "      git fetch --all"
    echo "      git pull --all"
}






# ==[ NPM ] ========================
# ==================================

function nx() {
    npm run $1;
}

function app() {
    echo creating a new app $1;
    mkdir -p $1/src; cd $1/src;
    mkdir -p bin data database controllers models middlewares utils routes public/images public/styles/globals public/scripts/globals views/includes views/login views/auth;
    cd ..;
    git init;
    echo -e '\n\nconst Lyh = "Lýh Oliveira Gangello";' >> app.js;
    echo '{"author": "","version": "0.1.0","description": "","private": true,"main": "app.js","keywords": [],"license": "ISC","scripts": {"init": "node ./app.js","dev": "nodemon ./app.js","lyh": "nodemon ./lyh.js"}}' > "./package.json" && npm init -y;
    yarn add bcrypt dotenv uuid mysql2 method-override node-fetch method express-validator express-session;
    yarn add nodemon @faker-js/faker --dev;
    echo -e "\n\nnode_modules\n.env\nbranches.yml" >> .gitignore;
    git add .;
    git commit -m "project bootstrap";
    git branch -M root;
    git switch -c dev;
    git branch -a > branches.yml;
    clear;
    echo -e "${amber} ==[ $1 ]==========================";
    code .;
    exit;
    exit;
}

function ejs-app() {
    echo creating a new app $1;
    mkdir -p $1/src; cd $1/src;
    mkdir -p bin data database controllers models middlewares utils routes public/images/globals public/styles/globals public/scripts/globals views/includes views/login views/auth;
    cd ..;
    git init;
    echo '{"author": "","version": "0.1.0","description": "","private": true,"main": "server.js","keywords": [],"license": "ISC","scripts": {"init": "node ./server.js","dev": "nodemon ./server.js","lyh": "nodemon ./lyh.js"}}' > "./package.json" && npm init -y;
    yarn add bcrypt ejs express express-validator express-session method-override method multer mysql2 node-fetch sequelize uuid dotenv;
    yarn add nodemon @faker-js/faker sequelize-cli --dev;
    echo -e '\n\nconst Lyh = "Lýh Oliveira Gangello";' >> server.js;
    echo -e '\n\nconst path = require( "path" );\n\nmodule.exports = {\n\t"config": path.resolve( "src", "config", "database.json" ),\n\t"migrations-path": path.resolve( "src", "config", "migrations" ),\n\t"models-path": path.resolve( "src", "models" )\n}' > .sequelizerc;
    echo -e "\n\nnode_modules\n.env\nbranches.yml" >> .gitignore;
    git add .;
    git commit -m "project bootstrap";
    git branch -M root;
    git switch -c dev;
    git branch -a > branches.yml;
    clear;
    echo -e "${amber} ==[ $1 ]==========================";
    code .;
    exit;
    exit;
}

function vr-app() {
    echo creating a new app $1;
    mkdir -p $1/src; cd $1/src;
    mkdir -p data database controllers models middlewares utils routes modules public/images/globals public/styles/globals public/scripts/globals views/includes views/login views/auth;
    cd ..;
    git init;
    echo '{"author": "","version": "0.1.0","description": "","private": true,"main": "server.js","keywords": [],"license": "ISC","scripts": {"dev": "vite","build": "vite build","preview": "vite preview"}}' > "./package.json" && npm init -y;
    yarn add gh-pages react react-dom phosphor-react react-router-dom bcrypt ejs express express-validator express-session method-override method multer mysql2 node-fetch sequelize uuid dotenv;
    yarn add vite @types/react @types/react-dom @vitejs/plugin-react nodemon @faker-js/faker sequelize-cli --dev;
    echo -e 'import { defineConfig } from "vite";\nimport react from "@vitejs/plugin-react"\n\n// https://vitejs.dev/config/\nexport default defineConfig( {\n\tbase: "/vite-app/",\n\tplugins: [ react() ],\n\tserver: {\n\t\tport: 8000,\n\t\thost: true\n\t}\n} );' > vite.config.js;
    
    echo -e '#!/usr/bin/env sh\n\n# abort on errors\nset -e\nyarn build\ncd dist\n\n# if you are deploying to a custom domain\n# echo 'www.example.com' > CNAME\ngit init\ngit switch -c main \n git add -A \ngit commit -m "deploy"\n\n# if you are deploying to https://<USERNAME>.github.io\n# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git main\n\n# if you are deploying to https://<USERNAME>.github.io/<REPO>\ngit push -f git@github.com:ceo-js/vite-app.git main:gh-pages\n\ncd -' > deploy.sh;
    
    echo -e '<!DOCTYPE html><html lang="pt-br"><head><title>Vite React App</title><meta charset="UTF-8" /><link rel="icon" type="image/svg+xml" href="/vite.svg" /><meta name="viewport" content="width=device-width, initial-scale=1.0" /></head><body><div id="root"></div><script type="module" src="/src/modules/main.jsx"></script></body></html>
' > index.html;

		echo -e 'import { useState } from "react";\nimport reactLogo from "../assets/react.svg";\nimport viteLogo from "../public/images/globals/vite.svg";\nimport "../public/styles/globals/App.css";\n\nfunction App() {\n\t const [ count, setCount ] = useState(0);\n\n\n\t return (\n\t\t <div className="App">\n\t\t\t<div>\n\t\t\t\t      <a href="https://vitejs.dev" target="_blank">\n\t\t\t\t\t     <img src={viteLogo} className="logo" alt="Vite logo" />\n\t\t\t\t     </a>\n\t\t\t\t      <a href="https://reactjs.org" target="_blank">\n\t\t\t\t\t  <img src={reactLogo} className="logo react" alt="React logo" />\n\t\t\t\t      </a>\n\t\t\t   </div>\n\t\t\t   <h1>Vite + React</h1>\n\t\t\t  <div className="card">\n\t\t\t\t     <button onClick={() => setCount((count) => count + 1)}>\n\t\t\t\t\t    count is {count}\n\t\t\t \t    </button>\n\t\t\t\t     <p>\n\t\t\t\t\t   Edit <code>src/App.jsx</code> and save to test HMR\n\t\t\t\t     </p>\n\t\t\t  </div>\n\t\t\t  <p className="read-the-docs">\n\t\t\t\t     Click on the Vite and React logos to learn more\n\t\t\t  </p>\n\t\t </div>\n\t );\n}\n\nexport default App;
' > "./src/modules/App.jsx";

		echo -e 'import React from "react";\nimport ReactDOM from "react-dom/client";\nimport App from "./App";\nimport "../public/styles/globals/index.css";\n\n\nReactDOM.createRoot( document.getElementById( "root" ) ).render(\n\t <React.StrictMode>\n\t\t  <App />\n\t </React.StrictMode>,\n);
' > "./src/modules/main.jsx";

    echo -e '\n\nconst Lyh = "Lýh Oliveira Gangello";' >> server.js;
    echo -e '\n\nconst path = require( "path" );\n\nmodule.exports = {\n\t"config": path.resolve( "src", "config", "database.json" ),\n\t"migrations-path": path.resolve( "src", "config", "migrations" ),\n\t"models-path": path.resolve( "src", "models" )\n}' > .sequelizerc;
    echo -e "\n\nnode_modules\n.env\nbranches.yml" >> .gitignore;
    git add .;
    git commit -m "project bootstrap";
    git branch -M root;
    git switch -c dev;
    git branch -a > branches.yml;
    clear;
    echo -e "${amber} ==[ $1 ]==========================";
    code .;
    exit;
    exit;
}

function pkgi {
    sudo apt install $1;
}

function xampp {
    if [ !$1 ]; then
    	sudo /opt/lampp/lampp start;
    elif [ $1 = "mysql" ]; then
        sudo /opt/lampp/xampp startmysql;
    elif [ $1 = "start" ]; then
    	sudo /opt/lampp/xampp start;
    elif [ $1 = "stop" ]; then
        sudo /opt/lampp/xampp stop;
    elif [ $1 = "restart" ]; then
        sudo /opt/lampp/xampp restart;
    elif [ $1 = "help" ]; then
        sudo /opt/lampp/xampp --help;
    fi
}



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
