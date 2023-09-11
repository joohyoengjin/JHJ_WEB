# 데이터 결합
# 세로 결합
library(readxl)
path <- "C:/JHJ/R/code/source/"
# 남성 카드 이용금액  -sample2_m_history.xlsx
# 여성 카드 이용금액  -sample2_f_history.xlsx
m_history <- paste0(path, "sample2_m_history.xlsx")
f_history <- paste0(path, "sample3_f_history.xlsx")

m_excel <- read_excel(m_history)
f_excel <- read_excel(f_history)
View(m_excel)
View(f_excel)

# 세로 결합
ex_bind <- bind_rows(m_excel, f_excel)
View(ex_bind)



# 가로 결합
library(readxl)
path <- "C:/JHJ/R/code/source/"
# 제주지역 21년 카드 이용금액  -sample4_y21_history.xlsx
# 제주지역 20년 카드 이용금액  -sample5_y20_history.xlsx
jeju_21 <- read_excel(paste0(path, "sample4_y21_history.xlsx"))
jeju_20 <- read_excel(paste0(path, "sample5_y20_history.xlsx"))

View(jeju_21)
View(jeju_20)

#
bind_inner <- inner_join(jeju_21,jeju_20, by = "ID")
bind_left <- left_join(jeju_21,jeju_20, by = "ID")
bind_right <- right_join(jeju_21,jeju_20, by = "ID")
bind_full <- full_join(jeju_21,jeju_20, by = "ID")

View(bind_inner)
View(bind_left)
View(bind_right)
View(bind_full)

install.packages("reshape2")
help('reshape2::cast')
??cast
