###step 0: 安装 git
  $ sudo yum install git-core git-gui git-doc           
  	[# rm -r ~/.ssh #]                             
  $ ssh-keygen -t rsa -C emial_address@qq.com           
  	[# 连续回车，默认将公钥放在～/.ssh/ #]          
  $ ssh -T git@github.com          

###step 1: 安装必要组件，编译环境

yum -y install make gcc openssl-devel zlib-devel  \          
	gcc gcc-c++ make autoconf readline-devel  \          
	curl-devel expat-devel gettext-devel      \          
	ncurses-devel sqlite3-devel mysql-devel   \          
	httpd-devel wget which            

###step 2: 安装 yaml（解析Ruby所用）

$ wget http://pyyaml.org/download/libyaml/yaml-0.1.4.tar.gz  
$ tar xzvf yaml-0.1.4.tar.gz  
$ cd yaml-0.1.4  
$ ./configure --prefix=/usr/local  
$ make  
$ sudo make install  

###step 3: 安装 Ruby

$ wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p0.tar.gz  
$ tar xzvf ruby-1.9.3-p0.tar.gz  
$ cd ruby-1.9.3-p0  
$ ./configure --prefix=/usr/local --enable-shared --disable-install-doc --with-opt-dir=/usr/local/lib  
$ make  
$ sudo make install  

###step 4: 更新 gem

$ gem update --system 
（用 gem 安装可能会出现写权限错误，把相应的目录用 chmod 加上缺少的权限，如 sudo chmod -R 777 dir）

###step 5: 安装 rails

$ gem install rails

###step 6: 安装 sqlite

$ yum install sqlite-devel

###step 7: 安装 nodejs

$ wget http://nodejs.org/dist/v0.6.18/node-v0.6.9.tar.gz  
$ tar zxvf node-v0.6.9.tar.gz  
$ cd node-v0.6.9  
$ ./configure --prefix=/usr/local/node  
$ make   
$ sudo make install  
$ sudo ln -s   /usr/local/node/bin/node  /usr/sbin/node    
$ sudo ln -s   /usr/local/node/bin/npm  /usr/sbin/npm  
  
###step 8: 测试  
$ rails new app

	[######################## 可能操作 #######################################
	###step 8.1: 安装 rake

	$ gem install rake -v '0.9.2.2

	###step 8.2: 安装 coffee-script

	$ gem install gem install coffee-script -v '2.2.0' coffee-script-source -v '1.3.3'  json （缺什么安装什么）

	###step 8.3: 安装 execjs

	$ gem install execjs -v '1.4.0'
	###############################################################################]

$ cd app  

$ rails server
