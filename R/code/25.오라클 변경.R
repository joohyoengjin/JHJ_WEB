### 방법 1
# 오라클 DB 연결
install.packages("DBI")
install.packages("ROracle")  # R 4.0.0 버전 까지 지원
library(DBI)
library(ROracle)

# 오라클 DB 연결 정보 : url, 계정명, 비밀번호
driver <- dbDriver("Oracle")
con <- dbConnect(driver, username = "human", password = "123456",
                 dbname = "", host = "localhost", port = 1521)


### 방법2
remove.packages('rJava')
remove.packages('DBI')
remove.packages('RJDBC')

install.packages('rJava')
install.packages('DBI')
install.packages('RJDBC')

library(rJava)
library(DBI)
library(RJDBC)

classPath <- "C:/JHJ/lib/ojdbc8.jar"
driver <- JDBC(driverClass = "oracle.jdbc.driver.OracleDriver"
               , classPath = classPath)

# 에러현상
# Error in .jinit(classPath) : Unable to create a Java class loader.


conn <- dbConnect(driver,
                  "jdbc:oracle:thin:@//localhost:1521/orcl",
                  "human",
                  "123456")


sql <- "SELECT * FROM board"

result <- dbGetQuery(conn, sql)


View(result)
names(result)

# 데이터 프레임 생성
data

# 데이터 프레임 -> 테이블에 추가
dbWriteTable(conn, "test", value = data, overwrite=TRUE)


# 연결 종료
dbDisconnect(conn)









