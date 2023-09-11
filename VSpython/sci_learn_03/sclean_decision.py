import pandas as pd
import numpy as np
# iris - 카테고리형 데이터
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split 
from sklearn.tree import DecisionTreeClassifier
# 알고리즘 수업에는 클래스 생성 연습도 필요하지만 시뮬레이션 확인만

iris = load_iris()

iris_data = iris.data
# print(iris_data)
iris_label = iris.target
# print(iris_label)
iris_feature = iris.feature_names
# print(iris_feature)

df_iris = pd.DataFrame(data=iris_data, columns=iris_feature)
print(df_iris)

# 훈련데이터를 셔플하고 훈련데이터를 추출 (150개중에서 보통 80%)
x_train, x_test, y_train, y_test = train_test_split(iris['data'], iris['target'],
                                                    random_state=10, test_size=0.2)
print(x_train.shape) # 112
print(x_test.shape)  # 38 => 총 150 개중

# desionTree 훈련 생성
dtree = DecisionTreeClassifier(random_state=42) # Depth 선택가능
dtree.fit(x_train, y_train)

# 정확도 확인
accurancy = dtree.score(x_test, y_test)
print('DT 알고리즘 정확도: ', accurancy)

# 예측위한 샘플 데이터
x_new = np.array([ [7.0, 2.0, 6.7, 0.4] ])
predict = dtree.predict(x_new)
print('dt를 통한 iris 예측값: ', iris['target_names'][predict])