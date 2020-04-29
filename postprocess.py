# 后处理模块
# 便于直接将文本导入到字幕软件，无需手动断句

# 每行最长字母数（包含空格与标点符号）
MAX_LINE = 40

final_text = []

with open("./output.txt", "r") as file:
    orig_text = file.read().replace("\n", "").split(". ")

for each_sentence in orig_text:
    final_text.append("")
    print(each_sentence)
    current_sentence_list = each_sentence.split(" ")
    while len(final_text[-1]) <= MAX_LINE:
        if len(current_sentence_list) > 0:
            final_text[-1] = final_text[-1] + " " + current_sentence_list.pop(0)
        else:
            final_text[-1] = final_text[-1] + "."
            break

with open("./output_postprocess.txt", "w") as file:
    for each in final_text:
        file.write(each + "\n")