# readxl 패키지 설치
install.packages("readxl")
library(readxl)
path <- "C:/JHJ/R/code/source/"
excel_data <- read_excel( paste0(path, "data_ex.xlsx"))
View(excel_data)
