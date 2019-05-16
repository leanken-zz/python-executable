# python-executable

本文档用于编译出MaxCompute Spark可用的Python可执行包, 包括了可指定的第三方库

# 创建流程

* git clone 本项目
* 编辑 requirements.txt, 格式可参考网上的其他资料 (可以指定三方库的版本, 不指定的话默认按照PIP的行为)
* 编辑完后 git add & git commit, commit完后可以不用push到remote
* 本地根据local的commit创建一个Tag <git tag -a "tagName">, 弹出的tag anotation可以详细写一下具体的requirements.txt
* push tag完毕后travis会启动任务并且把python可执行包编译出来 见 https://github.com/leanken/python-executable/releases
* 找到对应的Tag Release, 下载python-2.7-ucs4.zip即可

# MaxCompute Spark提交流程

See. https://help.aliyun.com/document_detail/118328.html?spm=a2c4g.11174283.6.769.68f5590eBLniWo

