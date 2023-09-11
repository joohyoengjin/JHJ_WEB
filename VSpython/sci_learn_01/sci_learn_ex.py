from sklearn.datasets import load_iris
import pandas as pd

iris_origin = load_iris()

iris_data = iris_origin.data

# print(iris_data)
iris_labels = iris_origin.target
# print(iris_labels)

df_iris = pd.DataFrame(iris_data, columns=iris_origin.feature_names)
print(df_iris)
