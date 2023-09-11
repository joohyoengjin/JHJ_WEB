import os 
import csv 

if os.path.exists('data/emp_data.csv'):
    fr = open('data/emp_data.csv', 'r' , encoding='utf-8')
    data = csv.reader(fr)
    
  
    my_list = ['기획', '영업', '없음' , '개발', '총무']
    print(my_list)

    my_set = set(my_list)

    print(my_set)
    
    
   
        
        
else:
    print('없음')