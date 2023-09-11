import matplotlib.pyplot as plt
from matplotlib import font_manager, rc
font_path ="C:/Windows/Fonts/NANUMMYEONGJO.TTF"
font = font_manager.FontProperties(fname=font_path).get_name()
rc('font', family=font)

# 영어 성적 30 명
scores = [90, 80, 60, 55, 65,
          70, 89, 68, 72, 67,
          80, 77, 90, 55, 98,
          60, 89, 70, 68, 78,
          100, 83, 89, 59, 100,
          55, 58, 78, 88, 98,]
# 카테고리로 나눔 A B C D F
# 막대그래프 학점별 인원수
# ==> 1번째 학점 계산
def count_grade(in_list) :
    #print(in_list)
    grade_cnt = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'F': 0}    
    for score in in_list:
        if score >= 90:
            grade_cnt['A'] += 1
        elif score >= 80:
            grade_cnt['B'] += 1
        elif score >= 70:
            grade_cnt['C'] += 1
        elif score >= 60:
            grade_cnt['D'] += 1
        else:
            grade_cnt['F'] += 1

    # print(grade_cnt)
    return grade_cnt

# ==> 2번째 서브 그래프 설정
# 파이그래프 학점별 퍼센트 (시작=90)
result = count_grade(scores)
x_grade = result.keys()
y_count = result.values()

fig = plt.figure()
sub_plt1 = fig.add_subplot(1,2,1)
sub_plt1.bar(x_grade, y_count)
plt.subplot(1,2,1)

sub_plt2 = fig.add_subplot(1,2,2)
sub_plt2.pie(y_count, labels=x_grade, startangle=90)
plt.subplot(1,2,1)

plt.show() 
