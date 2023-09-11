# 엑셀 데이터 가져오기
install.packages("readxl")
library(readxl)
path <- "C:/JHJ/R/code/source/"
file <- paste0( path, "선별진료소.xls")
clinic_data <- read_excel( file )

# 필요한 컬럼만 추출하기
data_raw <- clinic_data[,c(2:5)]  # 2~5열의 모든행 선택
head(data_raw)


# 데이터 추출 확인 및 컬럼명 변경
names(data_raw)

# 시도, 시군구, 의료기관명, 주소 -> state, city, name, adrr
names(data_raw) <- c("state" , "city", "name", "addr")
names(data_raw)



# 지역별(state) 선별 진료소 빈도 분석
table(data_raw$state)

# 지역별(state) 선별 진료소 빈도 - 막대 그래프
barplot(table(data_raw$state))

# 제주 선별 진료소 빈도
jeju_data <- data_raw[data_raw$state == "제주",]
head(jeju_data)
nrow(jeju_data)

# 제주 선별 진료소 - 위도,  경도 가져오기
install.packages("ggmap")
library(ggmap)
api_key <- "AIzaSyAvAv_PEK0POrxiRAbENVLK3506YUMEjCE"
register_google(api_key)

# mutate_geocode()
# - 데이터 세트의 주소를 기준으로 위도(lat), 경도(lon)를 추가하는 함수
jeju_data <- mutate_geocode(data = jeju_data, location=addr, source='google')

View(jeju_data)

# 제주 선별 진료소 지도 시각화 - 산점도로 표시
jeju_map <- get_googlemap('제주', maptype = 'roadmap', zoom =11)
ggmap(jeju_map) +
  geom_point(data = jeju_data,
             aes( x = lon, y = lat, color = factor(name)), size = 10)

# 제주 선별 진료소 지도 시각화 - 구글 마커로 표시
# - 데이터 세트에서 위도,경도를 마커 옵션으로 지정
# - 마커 정도 : 데이터 프레임 (경도, 위도)
jeju_marker <- data.frame(jeju_data$lon, jeju_data$lat)
jeju_map <- get_googlemap('제주', maptype = 'roadmap', zoom = 11,
                          markers = jeju_marker)

ggmap(jeju_map) +
  geom_text(data = jeju_data, aes(x = lon, y = lat),
            size = 8, label = jeju_data$name, col="blue" )





