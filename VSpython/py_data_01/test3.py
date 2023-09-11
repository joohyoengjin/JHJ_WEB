# 어떤 반에 학생 5명 있고 
# 각 사람의 자바 javas 는 80 60 70 90 75 일때
# 각 사람의 학점을 출력하시오

javas = [80, 60, 70, 90, 75]
# print(javas)
for j in javas:
    grade = ''
    if j>=90:
        grade = 'A'
    elif j>=80:     
        grade = 'B'
    elif j>=70:     
        grade = 'C'
    elif j>=60:     
        grade = 'D'
    else:
        grade = 'F'

    print(j, '는 ', grade)