# 엑셀 파일 가져오기
install.packages("readx1")
library(readxl)
path <- "C:/JHJ/R/code/source/"
file <- paste0( path, "forest.xls")
forest_data <- read_excel( file )
forest_data

# 변수명 변경
colnames(forest_data)
colnames(forest_data) <- c("name","city","gubun","area","number"
                           ,"stay","city_new","code","codename")

# 데이터 구조 및 앞부분 확인
str(forest_data)
head(forest_data)

# 시도별 휴양림 빈도 분석 - table() 함수
city_table <- table(forest_data$city)
barplot(city_table)

# 시도별 휴양림 빈도 분석 - freq() 함수
install.packages("descr")
library(descr)
freq(forest_data$city, plot = T, main = 'city')


# 시도별 휴양림 수 구하고, 내림차순 정렬하기
install.packages("dplyr")
library(dplyr)
# 데이터 전체 개수
count(forest_data)        

# 시도별 개수
count(forest_data, city)  

# 시도별 개수기준, 내림차순
count(forest_data, city) %>% arrange( desc(n) ) 


# - count(forest_data, city) 
# : 휴양림 데이터세트의 시도별 개수 → 데이터 프레임(city, n)
# - %>% arrange( desc(n) )  
# : 앞에서 구한 데이터 프레임의 n(개수) 기준으로 desc() 함수로 내림차순 정렬

# 파이프 연산자 미사용
x <- count(forest_data, city) 
arrange( x, desc(n) )


# 시도, 소재지_시도명, 제공기관명 별로 분포 내림차순 정렬
library(dplyr)
count(forest_data, city) %>% arrange( desc(n) ) 
count(forest_data, city_new) %>% arrange( desc(n) ) 
count(forest_data, codename) %>% arrange( desc(n) ) 













