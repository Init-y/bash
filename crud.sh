#!/bin/bash



function crud() {
    # ==[ server side ]=====================================
        echo bootstrap $1 server;
    # structure --------------------------------------------
        mkdir -p $1-app/$1-server/src && cd $1-app/$1-server/src &&
        mkdir -p bin data database controllers components models middlewares utils routes public/images/globals public/styles/globals public/scripts/globals views/includes views/login views/auth &&
        cd .. &&
    # dependencies -----------------------------------------
        echo '{"author": "","version": "0.1.0","description": "","private": true,"main": "server.js","keywords": [],"license": "ISC","scripts": {"init": "node ./server.js","dev": "nodemon ./server.js","lyh": "nodemon ./lyh.js"}}' > "./package.json" && npm init -y;
        yarn add bcrypt ejs express express-validator express-session cors  method-override method multer mysql2 node-fetch sequelize uuid dotenv &&
        yarn add nodemon @faker-js/faker sequelize-cli --dev;
    # files ------------------------------------------------
        # server.js
        echo -e '\n\nconst Lyh = "Lýh Oliveira Gangello";' >> server.js;
        # .sequelizerc
        echo -e '\n\nconst path = require( "path" );\n\nmodule.exports = {\n\t"config": path.resolve( "src", "config", "database.json" ),\n\t"migrations-path": path.resolve( "src", "config", "migrations" ),\n\t"models-path": path.resolve( "src", "models" )\n}' > .sequelizerc &&
    
    # ==[ client side ]=====================================
        echo bootstrap $1 client;
    # structure --------------------------------------------
        cd .. &&
        mkdir -p $1/src && cd $1/src &&
        mkdir -p data database controllers models middlewares utils routes modules public/images/globals public/styles/globals public/scripts/globals views/includes views/login views/auth;
        cd .. &&
    # dependencies -----------------------------------------
        echo '{"author": "","version": "0.1.0","description": "","private": true,"main": "server.js","keywords": [],"license": "ISC","scripts": {"dev": "vite","build": "vite build","preview": "vite preview"}}' > "./package.json" && npm init -y &&
        yarn add gh-pages axios @material-ui/core react react-dom phosphor-react react-router-dom bcrypt ejs express express-validator express-session cors method-override method multer mysql2 node-fetch sequelize uuid dotenv;
        yarn add vite @types/react @types/react-dom @vitejs/plugin-react nodemon @faker-js/faker sequelize-cli --dev;
    # files ------------------------------------------------
        # vite.config.js
        echo -e 'import { defineConfig } from "vite";\nimport react from "@vitejs/plugin-react"\n\n// https://vitejs.dev/config/\nexport default defineConfig( {\n\tbase: "/vite-app/",\n\tplugins: [ react() ],\n\tserver: {\n\t\tport: 8000,\n\t\thost: true\n\t}\n} );' > vite.config.js;
        # deploy.sh
        echo -e '#!/usr/bin/env sh\n\n# abort on errors\nset -e\nyarn build\ncd dist\n\n# if you are deploying to a custom domain\n# echo 'www.example.com' > CNAME\ngit init\ngit switch -c main \n git add -A \ngit commit -m "deploy"\n\n# if you are deploying to https://<USERNAME>.github.io\n# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git main\n\n# if you are deploying to https://<USERNAME>.github.io/<REPO>\ngit push -f git@github.com:ceo-js/vite-app.git main:gh-pages\n\ncd -' > deploy.sh;
        # index.html
        echo -e '<!DOCTYPE html><html lang="pt-br"><head><title>Vite React App</title><meta charset="UTF-8" /><link rel="icon" type="image/svg+xml" href="/vite.svg" /><meta name="viewport" content="width=device-width, initial-scale=1.0" /></head><body><div id="root"></div><script type="module" src="/src/modules/main.jsx"></script></body></html>' > index.html;
        # ./src/modules/App.jsx
        echo -e 'import { useState } from "react";\nimport reactLogo from "../assets/react.svg";\nimport viteLogo from "../public/images/globals/vite.svg";\nimport "../public/styles/globals/App.css";\n\nfunction App() {\n\t const [ count, setCount ] = useState(0);\n\n\n\t return (\n\t\t <div className="App">\n\t\t\t<div>\n\t\t\t\t      <a href="https://vitejs.dev" target="_blank">\n\t\t\t\t\t     <img src={viteLogo} className="logo" alt="Vite logo" />\n\t\t\t\t     </a>\n\t\t\t\t      <a href="https://reactjs.org" target="_blank">\n\t\t\t\t\t  <img src={reactLogo} className="logo react" alt="React logo" />\n\t\t\t\t      </a>\n\t\t\t   </div>\n\t\t\t   <h1>Vite + React</h1>\n\t\t\t  <div className="card">\n\t\t\t\t     <button onClick={() => setCount((count) => count + 1)}>\n\t\t\t\t\t    count is {count}\n\t\t\t \t    </button>\n\t\t\t\t     <p>\n\t\t\t\t\t   Edit <code>src/App.jsx</code> and save to test HMR\n\t\t\t\t     </p>\n\t\t\t  </div>\n\t\t\t  <p className="read-the-docs">\n\t\t\t\t     Click on the Vite and React logos to learn more\n\t\t\t  </p>\n\t\t </div>\n\t );\n}\n\nexport default App;' > "./src/modules/App.jsx";
        # ./src/modules/main.jsx
        echo -e 'import React from "react";\nimport ReactDOM from "react-dom/client";\nimport App from "./App";\nimport "../public/styles/globals/index.css";\n\n\nReactDOM.createRoot( document.getElementById( "root" ) ).render(\n\t <React.StrictMode>\n\t\t  <App />\n\t </React.StrictMode>,\n);' > "./src/modules/main.jsx";
        # .sequelizerc
        echo -e '\n\nconst path = require( "path" );\n\nmodule.exports = {\n\t"config": path.resolve( "src", "config", "database.json" ),\n\t"migrations-path": path.resolve( "src", "config", "migrations" ),\n\t"models-path": path.resolve( "src", "models" )\n}' > .sequelizerc;

    # root -------------------------------------------------
        cd ..;
    # git --------------------------------------------------
        git init &&
        echo -e "\n\nnode_modules\n.env\nbranches.yml" >> .gitignore &&
        git add . &&
        git commit -m "project bootstrap" &&
        git branch -M root &&
        git switch -c dev &&
        git branch -a > branches.yml &&
    # concludes --------------------------------------------
        clear &&
        echo -e "${amber} ==[ $1 ]==========================";
        code .;
        exit;
        exit;
}
