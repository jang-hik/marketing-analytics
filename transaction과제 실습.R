getwd()
setwd("C:/Users/wkdgu/Desktop/마빅/8주차/R 스크립트 파일")
data <- read.csv("C:/Users/wkdgu/Desktop/마빅/8주차/과제/transaction.csv")
head(data)




# 1. transaction에 포함된 고객의 수,기록기간이 무엇인지 파악하시오.

# 먼저 고객의 수를 파악해 보자
# userid컬럼에서 unique한 값들의 개수를 고객의 수라고 가정

custom_count <- length(unique(data$userid)) # 고객의 수는 38명
custom_count

# 모든 고객을이 2015년 7월 1,3,5일에 거래를 했다.
# 거래기간을 5일에서 1일을 뺀 4일이라고 가정
unique(data$transaction_date)

max(unique(data$transaction_date))
min(unique(data$transaction_date))

period <- (max(unique(data$transaction_date)) - min(unique(data$transaction_date)))
period  # 거래기간은 4일이다.




# -------------------------------------------
# is.element 함수는 두 벡터 A와 B가 있을 때, 벡터 A의 원소가 벡터 B에 속하는지 확인해주는 함수입니다. 
# > A=c(1,2,3)
# > B=c(2,4,6,8,10)
# > is.element(A,B)
# [1] FALSE  TRUE FALSE
# --------------------------------------------






# 2.각 고객의 일평균 거래횟수, 일평균 총소비량, 거래당 평균 소비량을 구하시오

# 2.1 각 고객의 일평균 거래횟수

# 각 고객의 일 평균 거래횟수
# unique한 userid별로 고객이라고 가정
# 분자는 거래기간 내에 총 거래횟수
# 분모는 거래일수

for(j in rep(unique(data$userid),1)){
  cat("useid", j, "번 고객님의 일평균 거래횟수는")
  print(sum(as.numeric(data$userid==j))/length(unique(data$transaction_date[data$userid==j])))
}




# -----------------------------------------------------
# rep() : 반복되는 수 생성함수


# a를 5번 반복
# > rep("a", times=5)
# [1] "a" "a" "a" "a" "a"


# c("a", "b", "c")를 벡터 통째로 3번 반복 
# > rep(c("a", "b", "c"),3)
# [1] "a" "b" "c" "a" "b" "c" "a" "b" "c"


# a를 먼저 2번 반복하고 b를 4번 반복
# > rep(c("a", "b"), c(2,4))
# [1] "a" "a" "b" "b" "b" "b"


# 1부터 3까지의 정수를 3번씩 반복
# > rep(1:3, each=3)
# [1] 1 1 1 2 2 2 3 3 3

# ---------------------------------------------------------




#----------------------------------------------------------
# seq() : 일정한 구조.순차 데이터 생성


# seq()를 이용하여 1부터 10까지 입력(1단위씩 커짐)
# > seq(from=1, to=10)
# [1]  1  2  3  4  5  6  7  8  9 10


# seq()를 이용하여 1~10까지 2단위씩 증가시키면서 입력
# > seq(from=1, to=10, by=2)
# [1] 1 3 5 7 9


# seq()를 이용하여 1~10까지 5개의 숫자를 등간격으로 생성
# > seq(1,10, length=5)
# [1]  1.00  3.25  5.50  7.75 10.00


# seq_len()을 이용하여 1부터 10까지 입력(1단위씩 커짐)
# > seq_len(10)
# [1]  1  2  3  4  5  6  7  8  9 10

# --------------------------------------------------------



# 2.2 각 고객의 일평균 총소비량
# 분자는 거래기난 내에 총 소비량
# 분모는 거래일수

for(j in rep(unique(data$userid),1)){
  cat("useid", j, "번 고객님의 일평균 총소비량")
  print(sum(data$spentmoney[data$userid==j])/length(unique(data$transaction_date[data$userid==j])))
}




# 2.3 각 고객의 거래당 평균 소비량을 구하시오
# 분자 : 거래기간 내에 총 소비량
# 분모 : 거래기간내에 총 거래횟수

for(j in rep(unique(data$userid),1)){
  cat("useid", j, "번 고객님의 거래당 평균 소비량")
  print(sum(data$spentmoney[data$userid==j])/sum(as.numeric(data$userid==j)))
}




# 4. 고객군을 연령대별로 10대/20대/30대/40대/50대/60대 이상으로 구분하는 변수 1개를 만드시오.
# user$age를 집어넣으면 연령대별로 몇명의 고객이 있는지 구분하는 함수 생성
# 


length(unique(data$userid)) # unique한 userid는 38, 즉 38명의 고객이 존재
length(unique(data$userage)) # unique한 userage는 19 


# 30대 고객의 수를 구합니다.
# 나이가 30대인 고객의 unique한 userid()를 세어줍니다.

age_30 <-c()
age_30

data$userage

for(i in data$userage){
  age_30<-c(age_30, ((2022-i)<40 & (2022-i)>=30))
}
age_30

unique(data$userid[age_30]) # 30대 고객의 userid
length(unique(data$userid[age_30])) # 30대 고객의 수





# 40대 고객의 수를 구합니다.
# 나이가 40대인 고객의 unique한 userid()를 세어줍니다.

age_40 <-c()
age_40

data$userage

for(i in data$userage){
  age_40<-c(age_40, ((2022-i)<50 & (2022-i)>=40))
}
age_40

unique(data$userid[age_40]) # 40대 고객의 userid
length(unique(data$userid[age_40])) # 40대 고객의 수




# 50대 고객의 수를 구합니다.
# 나이가 50대인 고객의 unique한 userid()를 세어줍니다.

age_50 <-c()
age_50

data$userage

for(i in data$userage){
  age_50<-c(age_50, ((2022-i)<60 & (2022-i)>=50))
}
age_50

unique(data$userid[age_50]) # 40대 고객의 userid
length(unique(data$userid[age_50])) # 40대 고객의 수



# 60대 고객의 수를 구합니다.
# 나이가 60대인 고객의 unique한 userid()를 세어줍니다.

age_60 <-c()
age_60

data$userage

for(i in data$userage){
  age_60<-c(age_60, ((2022-i)<700 & (2022-i)>=60))
}
age_60

unique(data$userid[age_60]) # 60대 고객의 userid
length(unique(data$userid[age_60])) # 60대 고객의 수








#-----------------
age_count <- c(10,20,30,40,50,60)
age_count


# x는 age_count를 인수로 받는 age_fx()함수 생성
# age_cnt는 연령별 고객의 수를 담는 벡터

age_fx <- function(x){
  imci <- c()
  age_cnt <- c()
  for(j in x){
    for(i in data$userage){
      imci<-c(imci, ((2022-i)<j+10 & (2022-i)>j))
      age_cnt <- c(age_cnt, length(unique(data$userid[imci])))
    }
  }
  return(age_cnt)
}
age_fx(age_count)



# -----------------------------


# 5. 연령대별 일평균 거래횟수, 일평균 총소비량, 거래당 평균 소비량을 구하시오.

# 5.1 연령대별 일평균 거래횟수를 구하시오

# 20대의 일평균 거래횟수
# 분자 : 20대 고객의 거래횟수 총합
# 분모 : 20대 고객수

# 20대 고객은 현재 1994년생, 1995년생 둘 밖에 없음

# 이거 잘못구함!! 
# 이걸로 여기서 나온 age_20은 모든 20대 고객의 거래횟수임
# 이거 잘못된 식임. 예를 들어 30대는 30~39가 아니라 39밑을 다 구한거ㅠㅠ



user_age <- function(x){
  age_10 <<- 0
  age_20 <<- 0
  age_30 <<- 0
  age_40 <<- 0
  age_50 <<- 0
  age_60 <<- 0
  
  for(i in x){
    if(2022-i<20){
      age_10 <<- age_10 + 1
    }else if(2022-i<30){
      age_20 <<- age_20 + 1
    }else if(2022-i<40){
      age_30 <<- age_30 +1
    }else if(2022-i<50){
      age_40 <<- age_40 +1
    }else if(2022-i<60){
      age_50 <<- age_50 +1
    }else{age_60 <<- age_60 +1}
  }
}

user_age(data$userage)  




