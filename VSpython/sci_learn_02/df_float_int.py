import pandas as pd

data = {
    'id' : [1,2,3,4,None],
    'name' : ['aaaa','bbbb','cccc','dddd','eeee']
}

df = pd.DataFrame(data)
print(df['id'].astype('Int64'))