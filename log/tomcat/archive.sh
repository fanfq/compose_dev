#!/bin/sh

lastDay=$(date -d last-day +'%Y-%m-%d')
echo "创建临时目录"
mkdir -p $lastDay

lastMon=$(date -d last-mon +'%Y-%m')
file=$(pwd)/archive/${lastMon}
if [ -e $file ]
then
echo "归档目录已存在"
else
echo "创建归档目录$(pwd)/archive/${lastMon}" 
mkdir -p $file
fi

echo "将文件移到临时目录"
find . -maxdepth 1 -name "*$lastDay*" -type f -exec mv {} ./$lastDay/ \;

echo "压缩临时目录并删除源文件"
tar -zcvf $lastDay.tar.gz $lastDay --remove-files

echo "将压缩包移到归档目录"
mv $lastDay.tar.gz $file

