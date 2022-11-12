getwd()
setwd('C:/Users/wkdgu/Desktop/마빅/14주차_6월 5일')
data <- read.csv("C:/Users/wkdgu/Desktop/마빅/14주차_6월 5일/insurance.csv")
data
attach(data)

# 지역별 인원 확인
table(region)

# 성별, 지역별, 흡연유무별 더미변수 생성
female=ifelse(sex=='female',1,0)
sw=ifelse(region=='southwest',1,0)
ne=ifelse(region=='northeast',1,0)
se=ifelse(region=='southeast',1,0)
nw=ifelse(region=='northwest',1,0)
smoke=ifelse(smoker=='yes',1,0)


reg <- c(sum(sw), sum(nw), sum(se), sum(ne)) # 지역별 인원을 reg에 벡터형식으로 넣어줍니다.
gender <- c(sum(female), -1*sum(female-1)) # 성별별 인원을 gender에 벡터형신으로 넣어줍니다.
sm <- c(sum(smoke), -1*sum(smoke-1)) # 흡연유무별 인원을 sm에 넣어줍니다.


# par()은 그래픽 인수를 설정하는 함수다.
# mfrow, mfcol의 인수 값은 길이가 2인 벡터값을 갖는다.
# 인수로 적용된 mfrow는 행을 우선으로 배치한다,  mfcol은 열을 우선으로 배치한다.
# 2행 4열로 그림을 그립니다.
par(mfrow=c(2,4))
hist(age)
hist(bmi)
hist(children)
barplot(gender, names=c('female', 'male'))
barplot(sm, names=c('smoker', 'non smoker'))
barplot(reg, names=c('sw', 'nw', 'se', 'ne'))
hist(charges)

# dev.off()는 plots창에 떠있는 모든 그림들을 지웁니다.
dev.off()

# 각 변수와 charges의 상관관계를 파악합니다.
cor(age,charges)
cor(female,charges)
cor(bmi,charges)
cor(childred,charges)
cor(smoke,charges)
cor(char,charges)

# 흡연유부별로 charges를 나눈 charge1,0을 생성합니다.
charge1 = charges[which(smoke==1)]
charge0 = charges[which(smoke==0)]

# 흡연유무별 보험료 분포도를 시각화합니다. 
par(mfrow=c(1,2))
hist(charge0)
hist(charge1)


# 흡연유무와 성별관의 관계를 시각화합니다.
# which(female==1) : 여성(female==1)의 위치를 반환합니다.
# smoke[which(female==1)] : 여성중에서 비흡연자는 0, 흡연자는 1로 나타냅니다.
sf = smoke[which(female==1)] # 여성 중 흡연자
sm = smoke[which(female==0)] # 남성 중 흡연자

# smoke[which(female==1)] - 1 : 여성 중 비흡연자는 -1, 흡연자는 0으로 나타냅니다.
nf = smoke[which(female==1)] - 1 # 여성 비흡연자
nm = smoke[which(female==0)] - 1 # 남성 비흡연자

sum(sf) # 흡연자중 여성의 수
sum(sm) # 흡연자중 남성의 수
-1*sum(nf) # 비흡연자중 여성의 수
-1*sum(nm) # 비흡연자중 남성의 수

# 시각화
sex_smoke <- c(sum(sf), sum(sm),  -1*sum(nf), -1*sum(nm))
barplot(sex_smoke, names=c('smoke_female', 'smoke_male', 'non smoke_female', 'non smoke_male'))


# 20살 이하중에서 흡연유무에 따른 보험료의 분포도를 시각화합니다.
charge_under20_smoker = charges[which(age<=20 & smoke==1)]
charge_under20_nonsmoker = charges[which(age<=20 & smoke==0)]
charge_over20_smoker = charges[which(age>20 & smoke==1)]
charge_over20_nonsmoker = charges[which(age>20 & smoke==0)]

par(mfrow=c(1,2))
hist(charge_under20_smoker)
hist(charge_under20_nonsmoker)


# 연령대에 따른 보험료 분포를 시각화합니다.
plot(x=age, y=charges)

# 흡연유무가 연령대에 따른 보험료 분포에 영향을 주는지 시각화합니다. 
age1 = age[which(smoke==1)]
age0 = age[which(smoke==0)]

par(mfrow=c(1,2))
plot(x=age1, y=charge1)
plot(x=age0, y=charge0)


# bmi에 따른 보험료 분포를 시각화합니다. 
plot(x=bmi, y=charges)

# 흡연유무가 bmi에 따른 보험료 분포에 영향을 주는지 시각화 합니다.
bmi1 = bmi[which(smoke==1)]
bmi0 = bmi[which(smoke==0)]

par(mfrow=c(1,2))
plot(x=bmi1, y=charge1, ylim=c(0, 70000))
plot(x=bmi0, y=charge0, ylim=c(0, 70000))


# smoke==0, smoke==1 간에 보험료의 평균에 차이를 주는지 알기위해 t.test 실행
t.test(charge0, charge1)

# age < 40, age >= 40 간에 본험료의 평균 차이가 있는지 알기위해 t.test 실행
age_under40 = charges[which(age<40)]
age_over40 = charges[which(age>=40)]

t.test(age_under40, age_over40)

# bmi < 25, bmi >= 25 간에 보험료에 차이가 있는지 알기위해 t.test 실행
bmi_under25 = charges[which(bmi<25)]
bmi_over25 = charges[which(bmi>=25)]

t.test(bmi_under25, bmi_over25)


# 회귀분석 실행
result=lm(log(charges)~age+female+bmi+smoke+bmi*smoke+sw+ne+se)
summary(result)











