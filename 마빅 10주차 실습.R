getwd()
setwd('C:/Users/wkdgu/Desktop/마빅/10주차_5월 4일')

a = 5
b = 10

# 세미콜론(;)을 쓰면 명령문을 한 줄로 연결해서 작성가능하다
if(a>=5)b=b+5;a=a-1

# 위와 동일
if(a>=5){
  b=b+5
  a=a-1
}

# 이렇게 하면 첫줄인 b=b+5만 계산됨
# if(a>=5) b=b+5
#          a=a+5
         
# 반복문
a=0
b=0
for (i in 1:20){
  for(j in 1:30){
    a=a+i+j
  }
  for (k in 1:15){
    b=b+i+k
  }
}
         

