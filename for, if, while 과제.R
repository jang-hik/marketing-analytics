getwd()
setwd("C:/Users/wkdgu/Desktop/마빅/5주차/과제")
math <- read.csv("math.csv")


# 1번
math
math$grade
math$english

ebaek <- dim(math)[1]
ebaek

cnt <- 0

for(i in 1:ebaek){
  if(math$grade[i]>=80 & math$english[i]>=80){
    cnt <- cnt+1
  }
}
cnt # 수학, 영어점수가 모두 80점을 넘는 학생은 70명


rm(list=ls())


# 2번
(ebaek <- dim(math)[1])

(sci_score <- 0)


for(i in 1:ebaek){
  if(math$grade[i]>=80 & math$english[i]>=80){
    sci_score <- sci_score + math$science[i]}}

sci_score
sci_mean <- sci_score/70
sci_mean


# 3번
ebaek <- dim(math)[1]
ebaek

cnt <- 0
i <- 1

while(i<=ebaek){
  if(math$grade[i]>=80 & math$english[i]>=80){
    cnt <- cnt+1
    }
  i <- i+1
}
cnt

# The RStudio console returns the error message “argument is of length zero”.
# The reason for this is that we have used an empty data object in the logical condition within the if-statement (i.e. x1 > 5). 
# This is not possible in R and therefore the RStudio console returns an error

# i가 0이면 while문이 돌아가지 않는다.



# 4번
ebaek <- dim(math)[1]
ebaek
i <- 1
i
sci_score <- 0
sci_score


while(i<=ebaek){
  if(math$grade[i]>=80 & math$english[i]>=80){
    sci_score <- sci_score + math$science[i]}
  i <- i+1
}
sci_score
sci_score_mean <- sci_score/70
sci_score_mean



# 5번
ebaek <- dim(math)[1]
ebaek
new_data <- NULL

for(i in 1:ebaek){
  if(math$iq[i] == 1){
    new_data <- rbind(new_data,math[i,])
  }
}
new_data



# 6번
ebaek <- dim(math)[1]
ebaek
new_data <- NULL
new_data

i <- 1
i

while(i<=ebaek){
  if(math$iq[i] == 1){
    new_data <- rbind(new_data,math[i,])}
  i <- i+1
}
new_data
    
    
    
    
    
    
    
  




