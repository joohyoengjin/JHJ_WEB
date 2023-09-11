import re

# 샘플 문자
text = 'In Brazil, the; Superior Electoral* Count bars former~president'

clean_text = re.sub(r'[^a-zA-Z ]', '', text)

words = clean_text.split()

total_words = len(words)

# 특수문자들은 제거하고 단어를 분리해서 총 몇개가 있는지?
print("Total words:", total_words)