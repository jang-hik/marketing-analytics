
# 1. mobile 데이터를 이용하여 다음의 문제들을 푸시오.
getwd()
setwd('C:/Users/wkdgu/Desktop/마빅/12주차_5월 18일')
mobile <- read.csv("C:/Users/wkdgu/Desktop/마빅/12주차_5월 18일/mobile.csv")
mobile



# 1.1. mobile 데이터에 포함된 정보를 요약하시오.
summary(mobile)
head(mobile)



# 1.2. 각 브랜드의 판매 실적 그래프를 이용하여 표현하고 비교하시오.
# 각 브랜드 별 매출 실적 꺽은 선 그래프
# sales는 주차별 매출액입니다.

sales1 <- cbind(mobile$week[which(mobile$brand=='LG')], mobile$sales[which(mobile$brand=='LG')])
sales2 <- cbind(mobile$week[which(mobile$brand=='Samsung')], mobile$sales[which(mobile$brand=='Samsung')])
sales3 <- cbind(mobile$week[which(mobile$brand=='Apple')], mobile$sales[which(mobile$brand=='Apple')])

plot(sales1[,1], sales1[,2], type='o', main='Sales of Mobile Phones', xlab='Week', ylab='Sales in Unint', ylim=c(4000, 11000))
lines(sales2[,1], sales2[,2], type='o', col=4)
lines(sales3[,1], sales3[,2], type='o', col=2)



# 1.3. model 변수에서 볼 수 있는 특이사항 (판매실적에 영향을 미칠 수 있는) 을 기술하시오.
# 각 브랜드 별 model변수 summary

summary(mobile$model[which(mobile$brand=='LG')])
summary(mobile$model[which(mobile$brand=='Samsung')])
summary(mobile$model[which(mobile$brand=='Apple')])



# 1.4. 브랜드 별 평균 판매 가격의 차이가 있는 지 검증하시오.

# pirce 변수는 주차별 판매가격입니다.
price1 <- mobile$price[which(mobile$brand=='LG')]
price2 <- mobile$price[which(mobile$brand=='Samsung')]
price3 <- mobile$price[which(mobile$brand=='Apple')]

# price_mean은 주차별 판매가격의 평균, 즉 110주차의 기간동안 평균 판매가격
price1_mean <- mean(mobile$price[which(mobile$brand=='LG')])
price2_mean <- mean(mobile$price[which(mobile$brand=='Samsung')])
price3_mean <- mean(mobile$price[which(mobile$brand=='Apple')])

# 판매가격의 시각화 
hist(price1)
hist(price2)
hist(price3)

# 판매가격 정규성 테스트
# sharipo test
  # H0 : 모집단은 정규분포를 따른다.
  # H1 : 모집단은 정규분포를 따르지 않는다.
shapiro.test(price1)
shapiro.test(price2)
shapiro.test(price3)
# 모든 price 변수의 모집단이 정규분포를 따르지 않음
# 브랜드별 평균 판매가격에 차이가 있는지 검증하기 위해 비모수 검정이 필요

# 비모수검정을 통한 각 브랜드별 평균 판매가격에 차이가 있는지 검증
# wilcox.test를 이용

# Ho : LG와 Samsung의 평균 판매가격에는 차이가 있다.
# H1 : LG와 Samsung의 평균 판매가격에는 차이가 없다.
wilcox.test(price1, price2) # p-value < 2.2e-16, 차이가 있다.

# Ho : LG와 Apple의 평균 판매가격에는 차이가 있다.
# H1 : LG와 Apple의 평균 판매가격에는 차이가 없다.
wilcox.test(price1, price3) # p-value < 2.2e-16, 차이가 있다.

# Ho : Samsung과 Apple의 평균 판매가격에는 차이가 있다.
# H1 : Samsung과 Apple의 평균 판매가격에는 차이가 없다.
wilcox.test(price2, price3) # p-value = 4.478e-12, 차이가 있다.



# 1.5. 브랜드 별 광고 지출액 차이가 있는 지 검증하시오.

# 각 브랜드의 주차별 광고지출액은 ad1에 담습니다.
ad1 <- mobile$advertising[which(mobile$brand=='LG')]
ad2 <- mobile$advertising[which(mobile$brand=='Samsung')]
ad3 <- mobile$advertising[which(mobile$brand=='Apple')]

# ad_mean은 주차별 판매가격의 평균, 즉 110주차의 기간동안 평균 판매가격
ad1_mean <- mean(mobile$advertising[which(mobile$brand=='LG')])
ad2_mean <- mean(mobile$advertising[which(mobile$brand=='Samsung')])
ad3_mean <- mean(mobile$advertising[which(mobile$brand=='Apple')])

# 광고지출액의 시각화 
hist(ad1)
hist(ad2)
hist(ad3)

# 광고지출액 정규성 테스트
# sharipo test
# H0 : 모집단은 정규분포를 따른다.
# H1 : 모집단은 정규분포를 따르지 않는다.
shapiro.test(ad1)
shapiro.test(ad2)
shapiro.test(ad3)
# 모든 ad 변수의 모집단이 정규분포를 따르지 않음
# 브랜드별 광고지출액의 평균에 차이가 있는지 검증하기 위해 비모수 검정이 필요

# 비모수검정을 통한 각 브랜드별 평균 광고지출액에 차이가 있는지 검증
# wilcox.test를 이용

# Ho : LG와 Samsung의 평균 광고지출액에는 차이가 없다.
# H1 : LG와 Samsung의 평균 광고지출액에는 차이가 있다.
wilcox.test(ad1, ad2) # p-value < 2.2e-16, 차이가 있다.

# Ho : LG와 Apple의 평균 광고지출액에는 차이가 없다.
# H1 : LG와 Apple의 평균 광고지출액에는 차이가 있다.
wilcox.test(ad1, ad3) # p-value < 2.2e-16, 차이가 있다.

# Ho : Samsung과 Apple의 평균 광고지출액에는 차이가 없다.
# H1 : Samsung과 Apple의 평균 광고지출액에는 차이가 있다.
wilcox.test(ad2, ad3) #  p-value < 2.2e-16, 차이가 있다.



# 1.6. 브랜드 명성, 가격, 카메라 화소, 프로세서 성능, 신모델 여부, 광고 지출액, 배터리 용량이 판매량에 어떠한 영향을 미치는 지 선형 회귀 분석을 수행하시오. 

# 브랜드 더미 변수 생성
LG <- 1*(mobile$brand == 'LG')
Samsung <- 1*(mobile$brand == 'Samsung')

# 신모델 여부 더미변수 생성, 모델이 바뀔 때부터 3주차까지는 더미변수 생성
new=rep(0,330)

for (i in 2:330){
  if(mobile$brand[i]==mobile$brand[i-1] & mobile$model[i]!=mobile$model[i-1]) new[i]=1
}
new[which(new==1)+1]=1
new[which(new==1)+1]=1
new

# 회귀식
fit = lm(mobile$sales~LG+Samsung+new+mobile$price+mobile$camera+mobile$processor+mobile$advertising+mobile$battery)
summary(fit)



# 1.7. 위의 선형 회귀식에 신모델 여부와 광고 지출액의 상호효과를 포함한 분석을 수행하시오. 
fit2=lm(mobile$sales~LG+Samsung+mobile$price+mobile$camera+mobile$processor+new+mobile$advertising+mobile$battery+new*mobile$advertising)
summary(fit2)
# interaction effect 해석
# 신모델은 광고지출액을 한단위 늘릴때마다 판매량이 -2.354e+00만큼 줄어든다.

