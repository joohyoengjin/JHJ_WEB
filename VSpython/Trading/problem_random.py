import pandas as pd

# 정해진 숫자를 55로 설정합니다.
target = 55

# 시행횟수를 저장할 변수를 초기화합니다.
count = 0

# 맞추기 위한 범위를 저장할 데이터프레임을 생성합니다.
df = pd.DataFrame({'lower': [1], 'upper': [100]})

# 범위의 중간값을 구하는 함수를 정의합니다.
def get_mid(row):
    return (row['lower'] + row['upper']) // 2

# 범위를 반으로 줄이는 함수를 정의합니다.
def update_range(row, target):
    mid = get_mid(row)
    if target < mid:
        return pd.Series({'lower': row['lower'], 'upper': mid - 1})
    elif target > mid:
        return pd.Series({'lower': mid + 1, 'upper': row['upper']})
    else:
        return pd.Series({'lower': mid, 'upper': mid})

# 범위가 하나의 숫자가 될 때까지 반복합니다.
while df['lower'].iloc[0] != df['upper'].iloc[0]:
    # 시행횟수를 증가시킵니다.
    count += 1
    # 범위를 반으로 줄입니다.
    df = df.apply(update_range, axis=1, args=(target,))

# 최종적으로 맞춘 숫자와 시행횟수를 출력합니다.
print(f"맞춘 숫자: {df['lower'].iloc[0]}")
print(f"시행횟수: {count}")