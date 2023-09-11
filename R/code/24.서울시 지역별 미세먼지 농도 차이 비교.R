# 필요한 데이터 추출
install.packages("readxl")
library(readxl)
path <- "C:/KHM/R/code/source/"
file <- paste0(path, "dust.xlsx")
dust_data <- read_excel(file)
head(dust_data)

# 성북구, 중구 데이터만 추출
install.packages("dplyr")
library(dplyr)
dust_data_select <- dust_data[,c("날짜","성북구","중구")]
View(dust_data_select)

# 결측치 확인
is.na( dust_data_select )         # TRUE : 결측치 
sum( is.na( dust_data_select ) )  # 결측치 개수



# 지역별 미세먼지 농도 기술통계량
install.packages("psych")
library(psych)

describe( dust_data_select$성북구 )
describe( dust_data_select$중구 )

# 미세먼지 단위 : 마이크로 그램 (㎍/m3)
# 1g = 1000mg
# 1mg = 1000㎍
# 1㎍ = 0.0000001g
# 40㎍ = 0.000004g
# 성북구와 중구 미세먼지 농도 상자 그림 그리기
boxplot( dust_data_select$성북구, dust_data_select$중구,
         main = "finedust", xlab = "AREA", names = c("성북구", "중구"),
         ylab = "FINEDUST_PM", col = c("blue", "green"))



# 지역별 미세먼지 농도 분산 차이 검정하기
var.test( dust_data_select$중구, dust_data_select$성북구 )


# 지역별 평균 차이 검정하기
t.test( dust_data_select$중구, dust_data_select$성북구, var.equal = T )


