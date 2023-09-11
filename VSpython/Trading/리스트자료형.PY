# 문제8
# 리스트 자료형
# word = ['해바라기','나팔꽃, '장미', '무궁화', '코스모스',
# '접시꽃', '선인장, '제비꽃', '국화', '에델바이스']
# 이중에서 이름의 길이가 같은 꽃들을 분리하여 출력하시오

word = ['해바라기','나팔꽃', '장미', '무궁화', '코스모스','접시꽃', '선인장', '제비꽃', '국화', '에델바이스']


flowers_by_length = {}

for flower in word:
    length = len(flower.replace(" ", ""))  
    if length not in flowers_by_length:
        flowers_by_length[length] = [flower]
    else:
        flowers_by_length[length].append(flower)


for length, flowers in flowers_by_length.items():
    if len(flowers) >= 2:
        print(f"꽃 이름의 길이 {length}:", ", ".join(flowers))

