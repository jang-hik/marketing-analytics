getwd()
setwd("C:/Users/wkdgu/Desktop/마빅/5주차/과제/과제 자료")


data <- read.csv("C:/Users/wkdgu/Desktop/마빅/5주차/과제/과제 자료/math.csv")
data


# plot()의 type 설정
# type는 그래프 타입을 지정합니다.

# type = "p" : 점모양 기본 그래프
# type = "l" : 선모양 그래프 
# type = "b" : 점과 선모양 그래프
# type = "c" : "b"에서 점을 생략한 모양
# type = "o" : 점과 선을 중첩한 모양
# type = "h" : 각 점에서 x축까지의 수직선 그래프
# type = "s" : 왼쪽값을 기초로 계단모양으로 연결한 모양
# type = "S" : 오른쪽 값을 기초로 계단모양으로 연결한 모양
# type = "n" : 축만 그래고 그래프는 그리지 않는다.



# 1번 : 학생들의 수학점수와 과제 점수의 연관성을 보여주는 산포도를 그려라
plot(x <-data$grade, y <- data$homework, type="p", main="수학점수와 과제점수간의 연관성", xlab="수학점수", ylab="과제점수")


# rep(반복되는 수, 반복할 횟수)



# 2번  
# 과제점수의 중앙값으로 학생들을 2개 그룹으로 구분짓고
# 수학 점수를 그룹별로 나누어 두개의 벡터에 저장하시오

data
med <- median(data$homework) # 과제점수의 중위값을 med에 넣어줍니다.
med  # med는 62
data$homework

length(data$homework) # length(data$homework)는 200입니다. 
Group <- rep(0,length(data$homework))  # 0을 200번 반복해서 200개의 0을 Group에 넣어줍니다.
Group # Group에는 0이 200개 들어가 있습니다.

which(data$homework > med) # data$homework에서 과제점수가 62점이 넘는 인덱스를 보여줍니다.

Group[which(data$homework > med)] <- 1   # Group에 과제점수가 62점이 넘는 인덱스에는 1을 넣어줍니다.

which(Group==0) # 과제점수가 62점 밑인 인덱스 번호
which(Group==1) # 과제점수가 62점 이상인 인덱스 번호

data$grade

math_hw62up <- data$grade[which(Group==1)]  # 과제점수가 62점 이상인 학생들의 수학점수
math_hw62low <- data$grade[which(Group==0)] # 과제점수가 62점 이하인 학생들의 수학점수

math_hw62up
math_hw62low





