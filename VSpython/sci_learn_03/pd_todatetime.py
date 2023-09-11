import pandas as pd

data = {
    'Date' : ['2015:03:01', '2015:03:01','2015:03:01'],
    'Cnt' : [100,200,300]
}
df_time = pd.DataFrame(data)
df_time['Date_new'] = pd.to_datetime(df_time['Date'], format='%Y:%m:%d')
print(df_time)