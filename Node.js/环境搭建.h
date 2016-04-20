从零开始搭建Node.js, Express, Jade, Mongodb服务器》

安装node.js:
1. http://nodejs.org/ 下载pkg 安装
2. 终端 node -v
       npm -v
3. 随意目录test下创建hello.js :
var http = require('http');
http.createServer(function(req, res){
    res.writeHead(200, {'Content-Type': 'text/plain'});
    res.end('Hello World\n');
}).listen(8808, '127.0.0.1');
console.log('Server running at http://127.0.0.1:8808');

3. 终端  node /Users/.../test/hello.js   若无误，则显示 Server running at http://127.0.0.1:8808
4. 访问 http://127.0.0.1:8808 ， 显示“Hello World”

http://www.toolmao.com/nodejs-express-ejs-mongodb-server
http://www.unfish.net/archives/772-20131207.html


安装Express：
1. 终端 sudo npm install -g express 
2. 终端 express nodetest1
3. 打开目录 nodetest1下package.json在 dependencies下加 （主意逗号）
"mongodb": "*",
    "monk": "*"
4. 终端 （进入nodetest1目录） npm install
5. 终端 npm start
6. 打开 http://localhost:3000   欢迎页面

安装Mongodb：
1. 下载http://mongodb.org/ 解压
2. nodetest1目录下创建data目录
3. open ~/.bash_profile   添加 export PATH="$PATH:/Users/admin/Documents/git/github/study_log/Node.js/test/mongodb-osx-x86_64-3.0.0/bin"
4. mongodb-osx-x86_64-3.0.0/bin 目录下 终端： mongod -dbpath /Users/admin/Documents/git/github/study_log/Node.js/test/nodetest1/data
5. 出现 waiting for connections on port 27017    成功
6. 终端 use nodetest1 
   终端 db.usercollection.insert({ "username": "testuser1", "email": "testuser1@testdomain.com" })

把mongo连接到node:
1. 



















