getwd()
setwd("C:/Users/wkdgu/Desktop/마빅/8주차/R 스크립트 파일")

math <- read.csv("C:/Users/wkdgu/Desktop/마빅/5주차/과제/과제 자료/math.csv")
math

# 1.1번 : 학생들의 수학 점수와 과제 점수의 연관성을 보여줄 수 있는 산포도를 그리시오. 
plot(x=math$grade, y=math$homework, main="수학점수와 과제점수간의 연관성",
     xlab="수학점수", ylab="과제점수")



# 1.2번 : 수학점수와 과제점수간의 scatter plot을 나타내는 함수를 생성하시오.
# plot()함수의 인수
  # type : 그래프 타입 지정
    # type="p" : 점모양 그래프(디폴트값)

dot <- function(x,y){
  plot(x,y,type="p", main="수학점수와 과제점수간의 연관성", xlab="수학점수", ylab="과제점수")
}

dot(math$grade, math$homework)



# 2.1번 : 과제점수의 중앙값으로 학생들을 두개의 그룹으로 나눠서 벡터로 저장

group <- rep(0, length(math$homework))
group[which(math$homework>median(math$homework))] <- 1
group

math_0 <- math$grade[which(group==0)]
math_1 <- math$grade[which(group==1)]

math_0
math_1




# 2.2
# 두개의 인수 가운데, 첫 번째 인수의 중앙값으로 그룹을 나누고 
# 나누어진 그룹에 따라 두번째 인수의 값을 두개의 벡터에 저장하는 함수를 작성하시오
# 첫번째 인수는 학생들의 과제점수, 두번째는 수학점수 



seg <- function(x,y){
  group <- rep(0, length(x))
  group[which(x>median(x))] <- 1
  
  temp0 <- y[which(group==0)]
  temp1 <- y[which(group==1)]
  
  outcome <- list("vertor0"<-temp0, "vector1"<-temp1)
  return(outcome)
}

result <- seg(math$homework, math$grade)
result

str(result[1])
str(result[[1]])

result[2]




# 3.1

# shapiro.test() : 데이터의 분포가 정규분포를 따르는지 검정
# 귀무가설 : 데이터가 정규분포를 따른다.
# 대립가설 : 데이터가 정규분호를 따르지 않는다.

shapiro.test(result[[1]])
shapiro.test((result[[2]]))

t.test(result[[1]], result[[2]])














