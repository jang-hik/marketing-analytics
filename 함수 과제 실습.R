getwd()
setwd("C:/Users/wkdgu/Desktop/마빅/7주차/과제")

math <- read.csv("C:/Users/wkdgu/Desktop/마빅/5주차/과제/과제 자료/math.csv")
math


# 1번 : 수학점수가 평균 이상인 학생을 그룹1, 평균 미만인 학생을 그룹2로 지정하는 함수를 쓰시오
# 함수의 인수: 학생들의 수학 점수 벡터
# 함수의 return: 그룹 벡터

mean(math$grade) # 수학점수의 평균은 80.755

math>=mean(math$grade) # 142명의 학생이 80.755보다 수학점수가 높음
math[math$grade>=mean(math$grade),]
str(math)
str(math$grade)
str(c(math$grade))

# 수학점수가 평균 이상인 학생들을 담아주는 group1()함수를 생성합니다.
group1 <- function(x){
  g1 <- NULL              # g1이라는 NULL값을 담은 임의의 객체를 생성해줍니다.
  math_mean <- mean(x)    # 수학점수가 들어오면 평균을 계산해 math_mean에 담아줍니다. 
  g1 <<- math[math$grade >= math_mean,]  # math 데이터프레임에서 수학점수가 평균 이상인 데이터프레임을 g1에 담아줍니다.
  return(g1)              # 평균이상의 수학점수를 가진 데이터프레임 g1을 반환합니다.
}
group1(math$grade)
# 함수안에서 선언한 변수는 함수안에서만 적용됩니다.
# <<- 로 써주면

# 수학점수가 평균 미만인 학생들을 담아주는 group2()함수를 생성합니다.
group2 <- function(x){
  g2 <- NULL
  math_mean <- mean(x)
  g2 <<- math[math$grade < math_mean,]
  return(g2)
}
group2(math$grade)




# 2번 : 과학 점수의 평균이 성별에 따라 다른지 t-test를 통해 검증하는 함수를 쓰시오
  # 함수의 인수 : x(성별벡터) <- math$gender, y(과학점수 벡터) <- math$science
  # return : t-test 결과
  # 남자를 0, 여자를 1

math$gender # 성별데이터를 파악합니다.
math$science # 과학점수 데이터를 파악합니다.

which(math$gender==0) # 1~100까지는 남자입니다. (남자=0)
which(math$gender==1) # 101~200까지는 여자입니다. 


# t-test 함수를 생성합니다.
t_test_func=function(x,y){   # x(성별인수) <- math$gender, y(과학점수 인수) <- math$science
  men=which(x==0)    # which(math$gender==0)
  women=which(x==1)  # which(math$gender==1)
  
  sci_men=y[men]     # math$science[which(math$gender==0)]
  sci_women=y[women] # math$science[which(math$gender==1)]
  
  t.test(sci_men, sci_women)}

t_test_func(math$gender, math$science)




# 3번 : 1,2번의함수를 이용하여 그룹1과 그룹2 학생들의 과학 점수 평균이 같은지 다른지 t test를 통해 검증하는 함수를 쓰시오.
  # 함수의 인수: 학생들의 수학 점수 벡터/ 과학 점수 벡터
  # 함수의 return:  t test 결과

# g1 : 수학점수가 평균 이상인 학생들이 담겨있는 데이터프레임 g1
# g2 : 수학점수가 평균 미만인 학생들이 담겨있는 데이터프레임 g2

# gruop1(math$grade)는 학생들의 수학성적을 인수로 받고 수학성적이 평균 이상인 학생들을 담은 전역변수 데이터프레임인 g1을 반환합니다.  
# gruop1(math$grade)는 학생들의 수학성적을 인수로 받고 수학성적이 평균 미만인 학생들을 담은 전역변수 데이터프레임인 g2을 반환합니다.

# 과제에서는 수학점수, 과학점수 두 가지 인수를 사용하고 위의 1,2번 함수를 모두 이용하라고 나왔지만
# 여기서는 내 방식대로 1번 함수와 학생들의 수학점수만 인수로 사용하는 함수를 제작
# x <- math$grade
group_t_test <- function(x){
  
  group1(x)         
  group2(x)
  
  sci1 <- g1$science
  sci2 <- g2$science
  
  t.test(sci1, sci2)
}

group_t_test(math$grade)







