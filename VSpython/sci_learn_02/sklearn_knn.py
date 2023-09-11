import numpy as np
import pandas as pd
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier

iris = load_iris()

iris_data = iris.data # numpy data
col_name = iris.feature_names # columns

df_iris = pd.DataFrame(data=iris_data, columns=col_name)
print(len(df_iris))
#print(df_iris) # 데이터를 가공=데이터처리 - 비정형데이터

# 지도학습 = 데이터 + 답(타겟)
#print(iris.target) # 150개의 훈련및테스트 데이터

# 학습하기 위해 훈련데이터 + 테스트데이터
x_train, x_test, y_train, y_test = train_test_split(iris['data'], iris['target'], random_state=0) # 랜덤시드 고정

print('x_test갯수:', x_test.shape)
print('y_test갯수:', y_test.shape)

# KNN 객체를 호출
super_knn = KNeighborsClassifier(n_neighbors=9)
super_knn.fit(x_train, y_train) # 학습

# 정확도 계산
accurency = super_knn.score(x_test, y_test) # 테스트
print('테스트의 정확도: ', accurency)

# 예측하기
z_new = [ [6.0, 2.5, 4.6, 0.5] ] # iris중에 무슨품종?
np_z_new = np.array(z_new)
print('새로운 데이터: ',np_z_new)
pre_result = super_knn.predict(np_z_new)
print(iris['target_names'])
print('예측값은: ', iris['target_names'][pre_result])