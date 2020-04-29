#!/bin/bash

# 首次启动将会下载模型文件
if [ ! -f model.pcl ]; then
  echo "下载模型文件中......"
  wget -O model.pcl https://nas.backup.lurenjia.in/f/3a4fb527030b4ac29f63/?dl=1
fi

# 清理临时文件
rm -rf temp.txt output.txt output_post.txt

echo "1. 编辑模式"
read -r -s -n1 -p "编辑完成后输入:wq进入下一步，按任意键继续 ... "
vim temp.txt
echo ""

echo "2. 开始自动添加标点符号"
cat temp.txt | python3 ./punctuator2/play_with_model.py model.pcl

echo "3. 开始润色文本"
cat temp.txt | python3 ./punctuator2/convert_to_readable.py "temp.txt" "output.txt"
echo -e "文本处理完成，内容为:\n$(cat output.txt)"

echo "4. 开始对文本进行后处理"
cat output.txt | python3 ./postprocess.py
echo -e "文本处理完成，内容为:\n$(cat output_postprocess.txt)"