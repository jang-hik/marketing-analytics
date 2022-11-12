getwd()
setwd("C:/Users/wkdgu/Desktop/마빅/8주차/R 스크립트 파일")

math <- read.csv("C:/Users/wkdgu/Desktop/마빅/5주차/과제/과제 자료/math.csv")
math
str(math)
summary(math)

# 1번 : Loop을 사용하지 않고 math에서 수학점수와 영어점수가 모두 80점 이상인 학생의 숫자를 파악하시오.

math$grade
math$grade>=80
math$grade[math$grade>=80]
str(math$grade[math$grade>=80])

math$english
math$english>=80
math$english[math$english>=80]


M <- math$grade>=80  # M에는 200개의 logi값이 들어가 있는 벡터(80점 넘으면 TRUE, 안넘으면 FALSE)
str(M)

E <- math$english>=80  # E에는 200개의 logi값이 들어가 있는 벡터(80점 넘으면 TRUE, 안넘으면 FALSE)
E

# TRUE는 1, FALSE는 0으로 처리, TRUE와 FALSE를 곱하면ㅁ 둘다 TRUE면 1, 하나라도 FALSE면 0으로 바뀜
# sum(M*E)를 통해 수학점수와 영어점수가 모두 80점이 넘는 학생들의 수를 세어줌
count <- sum(M*E)
count



# 2번 : Loop을 사용하지 않고 math에서 수학점수 및 영어점수 모두 80점 이상인 학생들의 평균 과학 점수를 구하시오.

M <- math$grade>=80  # M에는 200개의 logi값이 들어가 있는 벡터(80점 넘으면 TRUE, 안넘으면 FALSE)
M

E <- math$english>=80  # E에는 200개의 logi값이 들어가 있는 벡터(80점 넘으면 TRUE, 안넘으면 FALSE)
E

K <- M*E  # 둘 중 하나라도 80점이 못넘은 학생은 0, 둘 다 80점이 넘으면 1로 만들어줌
K         # 200개의 logi값이 들어있는 벡터, 둘다 80점이 넘으면 1, 하나라도 못넘으면 0으로 표시되어 있음

# sum(K)를 통해서 1의 값들을 모두 더해줌. 수학,영어가 80점이 모두 넘는 학생들의 수를 세어줌
# K에는 70개의 1, 130개의 0이 들어있음. 70명의 학생이 수학,영어점수가 80점이 넘음
sum(K)

str(K)
math$science

# sum(K*math$science)를 통해 수학,영어점수가 80점이 넘은 학생들의 과학점수를 합해줍니다. 
sum(K*math$science)

# sum(K*math$science)를 sum(K)로 나누어 평균을 구합니다.
average <- sum(K*math$science)/sum(K)
average




# 3번 : NULL을 사용하지 않고 math에서 iq 변수가 1의 값을 갖는 학생들의 데이터만을 포함한 새로운 데이터 셋을 만드시오. 




# 4번 : Loop을 사용하지 않고 math 데이터를 검색 iq 변수가 1의 값을 갖는 학생들의 데이터만을 포함한 새로운 데이터 셋을 만드시오. 
math[math$iq == 1,]

iq_math <- math[math$iq == 1,]
iq_math




# 5번 : Loop을 사용하지 않고 math에서 수학,영어가 모두 80점 이상인 학생들의 데이터만을 포함한 새로운 데이터 셋을 만드시오. 

math$grade>=80

math[math$grade>=80,]

dim(math[math$grade>=80,])

math_80 <- math$grade>=80
math_80

eng_80 <- math$english>=80
eng_80

math_80*eng_80
as.logical(math_80*eng_80)

math_eng_80<-math[as.logical(math_80*eng_80),]
math_eng_80

#------------------------------------------------
# 자료형변환 함수

# as.character() : 문자형으로
# as.numeric() : 숫자형으로
# as.logical : TRUE or FALSE로

# 문자에서 숫자 변환은 에러가 난다.
# -----------------------------------------------




# 6번 : for문을 이용하여 math에서 수학, 영어점수가 80점 이상인 학생들의 평균 과학 점수를 구하시오.

sci_sum <- 0
sci_count <- 0

for(i in 1:200){
  if(math$grade[i]>=80 & math$english[i]>=80){
    sci_sum <-sci_sum + math$science[i]
    sci_count <- sci_count + 1
  }
}

sci_avg <- sci_sum/sci_count
sci_avg




# 7번 : loop를 쓰지 않고 math에서 수학 또는 영어 점수가 80점 이상인 학생들의 평균 과학 점수를 구하시오.

math_80 <- math$grade>=80
math_80

english_80 <- math$english>=80
english_80

sum(math_80, english_80)

math_80 + english_80

str(math_80 + english_80)

sci_80 <- math[as.logical(math_80 + english_80),]
sci_80

sci_80$science
str(sci_80$science)

sum(sci_80$science)
length(sci_80$science)

sci80_avg <- sum(sci_80$science)/length(sci_80$science)
sci80_avg


# -------------------------------------------
# 7번 교수님 풀이

M <- math$grade>=80
M

E <- math$english>=80
E

(M+E)>0
K <- (M+E)>0
K

math$science

(K*math$science)
sum(K*math$science)

sum(K)

aveg <- sum(K*math$science)/sum(K)
aveg

# logi형과 numeric은 서로 연산이 가능하다.
# FALSE는 0, TRUE는 1이다

# > FALSE*3
# [1] 0
# > TRUE*3
# [1] 3

# > FALSE + 4
# [1] 4
# > TRUE + 2
# [1] 3







