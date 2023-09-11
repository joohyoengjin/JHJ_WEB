import datetime
from datetime import datetime, timedelta

today = datetime.today()
tommorow = today + timedelta(days=1)
print(tommorow)
# 내일의 날짜정보만 추출
#tomDate = tommorow.strftime('%Y-%m-%d일')
tomDate = tommorow.strftime('%Y')
print(tomDate)
tomTime = tommorow.strftime('%H:%M:%S')
print(tomTime)

