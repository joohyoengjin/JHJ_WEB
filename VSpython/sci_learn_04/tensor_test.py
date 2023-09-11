import tensorflow as tf

# 스칼라(단일값), 벡터(일차원), 
# 매트릭스(2차원), 텐서(3차원)

scalar = tf.constant(1)
vector = tf.constant([1,2,3])

tensor = tf.constant([[[1,2,3],[1,2,3],[1,2,3]],
                      [[1,2,3],[1,2,3],[1,2,3]],
                      [[1,2,3],[1,2,3],[1,2,3]]])
print(scalar)
print(vector)
print(tensor)