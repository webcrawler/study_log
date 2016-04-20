//Welcome learning courses.
console.log('hello');

setTimeout(function(){
console.log('callback is called')
}, 2000)

//require("model");

var os = require("os");
var result = os.platform(); //os.arch(); //os.type(); //os.release();
console.log(result);

var path_ = process.cwd();
console.log(path_);

//process.chdir("/a");

console.pr = function(d){
  process.stdout.write(d + '\n');
}
console.pr(10);

process.stderr.write("error...");

process.stdin.on('readable', function(){
  var chunk = process.stdin.read();
  if (chunk != null)
  {
    process.stdout.write('data: ' + chunk);
  }
  });

// 使用process.on()方法可以监听进程事件。
process.on('exit', function(code){
  console.log("hahahq..");
})
  var tick = Date.now();
  console.log(tick);
//process.exit();

process.on("uncaughtException", function(err){
    console.log(err + '-123');
});
//throw new Error('我是故意的');

process.stdout.setEncoding('utf8');

// 异步的将数据写入一个文件, 如果文件已经存在则会被替换
// fs.writeFile(filename, data, callback)
var fs = require("fs");
fs.writeFile('test.txt', 'hello,123', function(err){
  if(err) throw err;
  console.log("saved success");
});

// writeFile函数虽然可以写入文件，但是如果文件已经存在，我们只是想添加一部分内容，它就不能满足我们的需求了，很幸运，fs模块中还有appendFile函数，它可以将新的内容追加到已有的文件中，如果文件不存在，则会创建一个新的文件。使用方法如下：
// 例：fs.appendFile(文件名,数据,编码,回调函数(err));
// 编码格式默认为"utf8"，
fs.appendFile('test.txt', "date to append", function(err){
    if (err) throw err;
    console.log("data append success");
});

// 如何检查一个文件是否存在呢
// 例：fs.exists(文件，回调函数(exists));
fs.exists('/ect/dd', function(exists){
    console.log(exists ? "存在" : "不存在");
});

// rename函数的基本用法
//fs.rename("ss", "l", function(err){
//  if(err) throw err;
//      console.log("modify success");
//})

// 读取文件是最常用到的功能之一，使用fs模块读取文件语法如下：
// 例：fs.readFile(文件,编码,回调函数);
//fs.readFile(文件名, function (err, data) {
//  if (err) throw err;
//  console.log(data);
//});

// 删除文件 例：fs.unlink(文件,回调函数(err));

var url = require('url');
var urlStr = url.parse('http://www.baidu.com', false);
console.log(urlStr);

// parse函数的第三个参数也是布尔类型的，当参数为true，解析时会将url的"//"和第一个"/"之间的部分解析为主机名
urlStr = url.parse('http://www.baidu.com/news', false, true);
console.log(urlStr);

url.resolve('http://baidu.com/', '/search/error.html');


var path = require('path')
// normalize函数将不符合规范的路径经过格式化转换为标准路径,解析路径中的.与..外，还能去掉多余的斜杠。
var data = path.normalize('/path//normalize/hi/..');
console.log('路径: ' + data);

// join函数将传入的多个路径拼接为标准路径并将其格式化，返回规范后的路径，避免手工拼接路径字符串的繁琐
data = path.join('//path/', '/atr/////', '/jjhh');
console.log('路径: ' + data);

// dirname函数用来返回路径中的目录名
data = path.dirname('/foo/ll/hdhhd/jj');
console.log('路径: ' + data);

// basename函数可返回路径中的最后一部分，并且可以对其进行条件排除
var data1 = path.basename('/foo/strong/basename/index.html');
var data2 = path.basename('/foo/strong/basename/index.html','.html');
console.log(data1 + ' "and" ' + data2);

// extname函数返回路径中文件的扩展名(以最后一个'.'开始,返回'.'以及'.'以后的所有字符串,如没有'.',则返回空字符串). 
var data = path.extname('index.html');
console.log('拓展名: ' + data);


var querystring = require('querystring');
// stringify函数的作用就是序列化对象，也就是说将对象类型转换成一个字符串类型（默认的分割符（"&"）和分配符（"="））
var result = querystring.stringify( {foo:'bar', cool:['xy', 'likj']} );
console.log('序列化对象: ' + result);

//querystring.stringify("对象"，"分隔符"，"分配符")

// 反序列化函数  querystring.parse("字符串")
// querystring.parse("字符串"，"分隔符"，"分配符")  querystring.parse('foo@bar$cool@xux$cool@yys','@','$');


var util = require('util');
// util.inspect(object,[showHidden],[depth],[colors])是一个将任意对象转换为字符串的函数
var result = util.inspect(5);
console.log('检查: ' + result);













