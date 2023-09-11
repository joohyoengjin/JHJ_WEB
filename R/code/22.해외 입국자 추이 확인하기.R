# 엑셀 파일 가져오기
install.packages("readxl")
library(readxl)
path <- "C:/JHJ/R/code/source/"
file <- paste0( path, "entrance.xls")
entrance_data <- read_excel( file )
View(entrance_data)

# 데이터 구조 및 앞부분 확인
str(entrance_data)
head(entrance_data)


# 변수명 영어로 변경
colnames(entrance_data) <- c("country", "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC")
head(entrance_data)

# 국가명 띄어쓰기 제거
# gsub("찾을 문자열", "대체할 문자열", 데이터) 
# -문자열 대체 함수
entrance_data$country <- gsub(" ", "", entrance_data$country)
View(entrance_data)


# 국가 개수 확인
count(entrance_data)

## |>   : 네이티브 파이프 연산자
entrance_data |> nrow()
nrow(entrance_data)

# 1월 기준 상위 5개국 추출하기
country_desc <- entrance_data[order(-entrance_data$JAN),]
head( country_desc, n = 5 )

## |> 네이티브 파이프 연산자 사용
top5_country <- entrance_data[order(-entrance_data$JAN),] |> head(n = 5)
## order(-entrance_data$JAN) : 1월 기준 내림차순
## |> head(n = 5) : 1월 기준 내림차순한 데이터의 상위 5개



# 데이터 구조 재구조화하기
# - 열로 나열된 월별 데이터(JAN,FEB, ...)를 행으로 변환
install.packages("reshape2")
library(reshape2)
top5_melt <- melt(top5_country, id.vars='country', variable.name='mon')
head(top5_melt)
View(top5_melt)


# 2020년 월별 입국자 수
# - 데이터 변화 추이        : 선 그래프
# - 상위 5개국 국가별 변화  : 막대 그래프, 누적 막대 그래프


# 2020년 월별 입국자 수 - 선 그래프
install.packages("ggplot2")
library(ggplot2)
ggplot(top5_melt, aes(x = mon, y = value, group = country)) +
  geom_line(aes(color = country)) +
  ggtitle("2020년 국적별 입국자 수 변화 추이") +
  scale_y_continuous(breaks = seq(0, 500000, 50000))

# scale_y_continuous()
# - breaks : y축 범위 조정 옵션 
# - seq(최솟값, 최댓값, 단위)
# * 여기서는 0~500000 (오십만명) 범위로 5만명씩 눈금 단위 지정

# 2020년 월별 입국자 수 - 막대 그래프
ggplot(top5_melt, aes(x = mon, y = value, fill = country)) +
  geom_bar(stat = "identity", position = "dodge") +
  ggtitle("2020년 국적별 입국자 수 변화 추이") +
  scale_y_continuous(breaks = seq(0, 500000, 50000))


# 2020년 월별 입국자 수 - 누적 막대 그래프
ggplot(top5_melt, aes(x = mon, y = value, fill = country)) +
  geom_bar(stat = "identity", position = "stack") +
  ggtitle("2020년 국적별 입국자 수 변화 추이") +
  scale_y_continuous(breaks = seq(0, 1000000, 50000))



