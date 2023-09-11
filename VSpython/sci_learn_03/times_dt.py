import datetime
from datetime import datetime

now = datetime.now()
today = datetime.today()
# print(now)
print('현재시간 t: ', today)
prev = datetime(1988, 8,13)
print('과거의시간 t-35: ', prev)
next = datetime(2033, 8,1, 10,0,0)
print('미래의시간 t+10: ', next)

# 시간간격
delt = today - prev
print('현재-과거시간차:', delt)
print('현재-과거날짜차:', delt.days)
print(type(delt.days))

