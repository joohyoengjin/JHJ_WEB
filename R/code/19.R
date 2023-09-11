# 데이터 시각화
# ggplot2
# Grammer of Graphics plot

install.packages("ggplot2")
library(ggplot2)

# 그래프 기본 틀 생성
str(airquality)
ggplot(airquality, aes(x = Day, y = Temp))

# 산점도 그리기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point()

ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point(size = 1.5 , color = "blue" , shape=16, alpha=0.5)

# 선 그래프 그리기
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_line(size = 0.5,linetype=1, color=2,alpha=0.9)

# 산점도 + 선 그래프
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_point()

# 막대 그래프
ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_bar()

ggplot(airquality, aes(x = Day, y = Temp)) +
  geom_bar(width = 1.5, fill = c("red", "green","blue"),color = "black")

# 누적 막대 그래프
ggplot(mtcars, aes( x= factor(cyl)))
  geom_bar(aes(fill = factor(gear)))
  
# 선버스트 차트
ggplot(mtcars, aes( x= factor(cyl))) +
  geom_bar(aes(fill = factor(gear))) +
  coord_polar()

# 선버스트 차트 -  도넛 모양
ggplot(mtcars, aes( x= factor(cyl))) +
geom_bar(aes(fill = factor(gear))),(
                color="blue") + coord_polar(theta = "y")

# 상자 그림 그래프
ggplot(airquality, aes(x = Day, y = Temp, group=Day)) +
  geom_boxplot()

ggplot(airquality, aes(x = Day, y = Temp, group=Day)) +
  geom_boxplot( width =1 , fill="blue", color = "red")

# 히스토그램
ggplot(airquality, aes(Temp)) +
  geom_histogram(color="white",binwidth=2,center=T)

# 평행선
library(ggplot2)
# 개인 저축률의 평균치를 평행선으로 추가
ggplot( economics, aes( x = date, y = psavert )) + 
  geom_line() +
  geom_hline(yintercept = mean(econmoics$psavert)
             , color = "red")

# 수직선
library(dplyr)
library(ggplot2)
# 개인 저축률의 최솟값이 나온 기간을 수직선으로 추가
min_date <- filter(ecomomics,psavert == min(economics$psavert) )$date
min_date

# 사선, 평행선, 수직선
ggplot( economics, aes( x = date, y = psavert)) +
  geom_line() +
  geom_abline(intercept = 12.18, slope = -0.0005444
              ,color = "red")+
  geom_hline(yintercept = mean(econmo))