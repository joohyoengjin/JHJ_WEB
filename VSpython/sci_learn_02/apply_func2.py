import pandas as pd

fish_data = [
    [240, 25.0, 10.0, 5.5],
    [190, 18.0, 7.0, 4.5],
    [110, 9.0, 5.0, 3.5],
    [50, 5.0, 3.0, 1.5]
]
df = pd.DataFrame(fish_data,columns=['X','Y','Z','H'])
print(df)

def half(x):
    return x/2

result = df.apply(half)
print(result)