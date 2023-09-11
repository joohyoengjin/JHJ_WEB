import pandas as pd
import numpy as np
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.svm import SVC

#1 데이터를 가져온다
iris = load_iris()
iris_data = iris['data']
iris_label = iris['target']
print(iris_data)

x_train, x_test, y_train, y_test = train_test_split(iris_data, 
                                                    iris_label,
                                                    test_size=0.2)
#print(x_train.shape)
#print(x_test.shape)

#2 SVM의 경우 전처리가 필요할 수 있음 (너무 큰값이나 작은값 제거)
# print( min(x_train[:, 0]) )
# print( max(x_train[:, 0]) )
# print()
# print( min(x_train[:, 1]) )
# print( max(x_train[:, 1]) )
# print()

standard = StandardScaler()
standard.fit(x_train)
standard.fit(x_test)
x_train_mean = standard.transform(x_train) # 훈련 데이터
x_test_mean = standard.transform(x_test)   # 테스트 데이터
# print( min(x_train_mean[:, 0]) )
# print( max(x_train_mean[:, 0]) )
# print()
# print( min(x_train_mean[:, 1]) )
# print( max(x_train_mean[:, 1]) )

# 모델생성 후 훈련
svm_cls = SVC(kernel='rbf', C=8, gamma=0.1) # linear, poly, rbf
svm_cls.fit(x_train_mean, y_train)

# 샘플데이터 예측
x_new = np.array([ [7.0, 2.0, 6.7, 0.4] ]) #2
standard.fit(x_new)
x_new_mean = standard.transform(x_new)
y_new = svm_cls.predict(x_new_mean)
print('예측값: ', iris['target_names'][y_new])

# 정확도 계산
accuracy = svm_cls.score(x_test_mean, y_test)
print('정확도: ', accuracy)