# AutoPunctuationCorrector
> 自动补全/纠正英文标点符号，可配合Youtube自动字幕，帮助简化英语字幕文本制作流程

## 依赖

- Python3
- Theano
- numpy

## 使用方法
> 注意：本程序暂不支持Windows环境，但你可以通过安装WSL的方式获取Windows支持

1. Clone本仓库，安装requirements.txt下的依赖

2. 执行`./run.sh`，首次运行时会下载一个模型文件

3. 按照提示输入文本并保存

4. 稍等片刻，脚本将会输出补全标点符号后的文本

## 修改

后处理部分会对句子进行拆分，默认保证每一行少于40个字母，你可以修改`postprocess.py`的`MAX_LINE`参数修改为你所需的长度。

## 原理

使用双向循环神经网络实现标点预测和补全，后处理部分将会通过空格将句子拆分为行。

## 鸣谢

- [ottokart/punctuator2](https://github.com/ottokart/punctuator2) （核心代码与预训练的模型）

## 开源协议

Apache 2.0 License