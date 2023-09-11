import pandas as pd
import csv
import os



df = pd.read_csv('examdata\소상공인시장진흥공단_상가(상권)정보_경남_202306.csv', encoding='utf-8')
df = pd.read_csv('examdata\소상공인시장진흥공단_상가(상권)정보_경기_202306.csv', encoding='utf-8')


     
            


print(len(df[df['상호명'].str.contains('세븐일레븐')]))
print(len(df[df['상호명'].str.contains('GS25')]))
print(len(df[df['상호명'].str.contains('CU')]))
print(len(df[df['상호명'].str.contains('씨유')]))

