st_name = ['송지우', '심현준', '윤호민']
st_score = [93, 78, 89]


for i in range(len(st_name)):
    name = st_name[i]
    score = st_score[i]
    
    if score >= 90:
        grade = 'A'
    elif score >= 80:
        grade = 'B'
    elif score >= 70:
        grade = 'C'
    elif score >= 60:
        grade = 'D'
    else:
        grade = 'F'
    
    print(f"-{name}- 학점: {grade}")
