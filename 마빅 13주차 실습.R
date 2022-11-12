getwd()
setwd('C:/Users/wkdgu/Desktop/마빅/13주차_5월 25일')
data=read.csv("insurance.csv",sep=",",header=TRUE)
data

# warpbreaks 데이터를 사용하겠다고 선언 : data(warpbreaks)
# warpbreaks 데이터를 고정하겠다고 선언 : attach(warpbreaks )     
# detachd(warpbreaks)를 하면 고정이 해지된다
summary(data)
attach(data)


hist(bmi) # bmi는 정규분포 형태입니다.
hist(age) # age는 일양분포형태입니다.
hist(charges) # charges는 skewed to the right, positively skewed
charges <- log(charges) # log를 씌워서 정규분포로 만듭니다.
hist(charges) # 로그를 씌운 charges는 정규분포 형태입니다.


# ifelse문은 if문의 한계를 해결하여 벡터 연산(각 요소별 조건 검사)이 가능합니다.
# 단점은 주어진 값에 따라 yes or no 를 반환해주고, 리턴값만 반환하기 때문에 오직 출력만 가능하고 조건별 명령어 수행은 불가합니다.
# ifelse(조건, True일 때 리턴할 값, False일 때 리턴할 값)
female <- ifelse(sex == 'female', 1, 0)
SW <- ifelse(region == 'southwest', 1, 0)
NE <- ifelse(region == 'northease', 1, 0)
SE <- ifelse(region == 'southeast', 1, 0)
smoker <- ifelse(smoker == 'yes', 1, 0)


# 회귀식을 돌립니다.
# 종속변수 charges에는 로그를 씌운 log-linear model입니다.
# X가 한 단위 변할 때 Y는 100*B1%만큼 변화
result1 <- lm(charges~age+female+bmi+smoker+SW+NE+SE)
summary(result1)


# interaction effect를 추가한 회귀식을 돌립니다.
# 종속변수 charges에는 로그를 씌운 log-linear model입니다.
# X가 한 단위 변할 때 Y는 100*B1%만큼 변화
result2 <- lm(charges~age+female+bmi+smoker+SW+NE+SE+bmi*smoker)
summary(result2)













