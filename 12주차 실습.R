getwd()
setwd('C:/Users/wkdgu/Desktop/마빅/12주차_5월 18일')
math=read.csv("math.csv",sep=",",header=TRUE)
math

# fit1의 회귀식 : 성적 = 성별 + 출석 + 숙제 + iq
fit1 = lm(math$grade~math$gender+math$attendance+math$homework+math$iq)
summary(fit1)

# iq2 더미변수 생성, iq가 2인 집단은 1, 나머지는 0
iq2 <- 1*(math$iq == 2)
iq2

# iq3 더미변수 생성, iq가 3인 집단은 1, 나머지는 0
iq3 <- 1*(math$iq == 3)
iq3


# fit2 dummy effect
fit2 <- lm(math$grade ~ math$gender+math$attendance+math$homework+iq2+iq3)
summary(fit2)

# fit2에서 더미변수 해석
# Coefficients:
#                 Estimate   Std. Error t value Pr(>|t|)    
# (Intercept)     13.46613   11.50596   1.170    0.243    
# math$gender     -3.20019    3.27708  -0.977    0.330    
# math$attendance  0.02565    0.10297   0.249    0.804    
# math$homework    0.73651    0.08623   8.541 3.87e-15 ***
# iq2              6.80667    4.27978   1.590    0.113    
# iq3             26.30974    4.32435   6.084 6.13e-09 ***

# 해석의 기준은 iq1집단(iq2=0, iq3=0)
# iq2집단은 iq1 집단에 비해 성적이 6.80667만큼 높다
# iq3집단은 iq1 집단에 비해 성적이 26.30974만큼 높다



# fit3는 interaction effect(더미*연속형)
# interaction effect : 한 변수의 효과가 다른 변수의 값의 크기에 영향을 받는 것
fit3=lm(math$grade~math$gender+math$attendance+math$homework+iq3+iq3*math$homework)
summary(fit3)

# fit3에서 interaction 효과 해석
# Coefficients:
#                    Estimate  Std. Error t value Pr(>|t|)    
# (Intercept)        7.65768   11.99851   0.638 0.524084    
# math$gender       -2.31211    3.28339  -0.704 0.482163    
# math$attendance    0.03990    0.10248   0.389 0.697424    
# math$homework      0.85181    0.09996   8.521 4.37e-15 ***
# iq3               51.93815   13.84050   3.753 0.000231 ***
# math$homework:iq3 -0.41815    0.18703  -2.236 0.026508 *  

# iq3집단은 iq1,2집단에 비해 평균적으로 성적이 51.93815 더 높다.
# iq 1,2집단은 homework이 1점 오를 때 성적이 0.85181만큼 오른다.
# iq 3집단은 homework이 1점 오를 때 성적이 0.85181 -0.41815 = 0.43366만큼 오른다.  
# iq3집단은 iq1,2집단에 비해 homework 점수가 1점 오를 때  성적이 -0.41815  덜 오른다.
# iq에 따라서 homework가 성적에 미치는 영향이 다르다.



# fit4
fit4=lm(math$grade~math$gender+math$attendance+math$homework+iq2+iq2*math$homework+iq3+iq3*math$homework)
summary(fit4)

# fit4의 계수가 유의미하다고 가정하고 해석
# Coefficients:
#                   Estimate   Std. Error t value Pr(>|t|)    
# (Intercept)        4.68839   14.17346   0.331 0.741167    
# math$gender       -2.36361    3.32144  -0.712 0.477562    
# math$attendance    0.03950    0.10253   0.385 0.700455    
# math$homework      0.83297    0.14037   5.934 1.36e-08 ***
# iq2                3.98855   15.53813   0.257 0.797690    
# iq3               54.92727   16.09549   3.413 0.000785 ***
# math$homework:iq2  0.03794    0.20053   0.189 0.850117    
# math$homework:iq3 -0.39875    0.21385  -1.865 0.063768 .  

# homework*iq3의 계수는 iq3집단이 iq1집단에 비해 homework점수가 1점 올랐을 때 더 증가할 거라고 예상되는 점수의 증가폭
# iq1집단은 homework점수가 1점 오르면 성적은 0.83297만큼 오른다.
# iq3집단은 homework점수가 1점 오르면 성적은 0.83297 -0.39875 = 0.43422만큼 오른다.




# fit5-1 intereacion effect(연속형*연속형)
fit5=lm(math$grade~math$gender+math$attendance+math$homework+math$attendance*math$homework)
summary(fit5)

# fit5의 homework와 attendance*homework의 계수만 유의미하다고 가정(attecdance의 계수는 유의미하지 않음)
# Coefficients:
#                               Estimate   Std. Error t value Pr(>|t|)  
# (Intercept)                   84.101751  45.390663   1.853   0.0654 
# math$gender                   -3.202630   3.621690  -0.884   0.3776  
# math$attendance               -0.607830   0.522886  -1.162   0.2465  
# math$homework                 -0.059178   0.573566  -0.103   0.9179  
# math$attendance:math$homework  0.008755   0.006629   1.321   0.1881  

# attendance =  -0.607830 
# homework = -0.059178
# attendance*homework 때문에 위의 두 계수가 마이너스로 나오는 듯 하다.
# attendance*homework = 0.008755

# attendance = 30일 때, homework점수가 1점 오를때 오르는 성적
# -0.059178 + 30*0.008755 = 0.203472

# attendance가 = 100일 때, homework점수가 1점 오를때 오르는 성적
# # -0.059178 + 100*0.008755 =  0.816322

# attendance가 높으면 homework이 1점 오를 때 성적이 더 많이 오른다.
# attendance에 따라서 homework이 성적에 미치는 영향이 달라진다.




# fit5-2 intereacion effect(연속형*연속형)
fit5=lm(math$grade~math$gender+math$attendance+math$homework+math$attendance*math$homework)
summary(fit5)

# fit5의 homework, attendence, attendance*homework의 계수만 유의미하다고 가정
# Coefficients:
#                               Estimate   Std. Error t value Pr(>|t|)  
# (Intercept)                   84.101751  45.390663   1.853   0.0654 
# math$gender                   -3.202630   3.621690  -0.884   0.3776  
# math$attendance               -0.607830   0.522886  -1.162   0.2465  
# math$homework                 -0.059178   0.573566  -0.103   0.9179  
# math$attendance:math$homework  0.008755   0.006629   1.321   0.1881  

# homework = -0.059178
# attendance =  -0.607830 
# attendance*homework 때문에 위의 두 계수가 마이너스로 나오는 듯 하다.
# attendance*homework = 0.008755

# attendance = 30일 때, homework점수가 1점 오를때 오르는 성적
# -0.059178 + 30*0.008755 = 0.203472

# attendance가 = 100일 때, homework점수가 1점 오를때 오르는 성적
# # -0.059178 + 100*0.008755 =  0.816322

# attendance가 높으면 homework이 1점 오를 때 성적이 더 많이 오른다.
# attendance에 따라서 homework이 성적에 미치는 영향이 달라진다.

# homework = 50일 때 , attendence 점수가 1점 오를 때 오르는 성적
# -0.607830 + 50*0.008755 = -0.17008

# homework = 100일 때 , attendence 점수가 1점 오를 때 오르는 성적
# -0.607830 + 100*0.008755 =  0.26767

# homework가 높으면 attendance이 1점 오를 때 성적이 더 많이 오른다.
# homework에 따라서 attendance가 성적에 미치는 영향이 달라진다.




# fit6에서 intercept는 gender, attendence, homework = 0인 학생이 받을 거라고 예상되는 점수
# intercept는 gender, attendence, homework = 0인 학생이 받을 거라고 예상되는 최소한의 점수가 아님!!
# 하지만 실제로 attendence, homework = 0이 학생은 없으므로 intercept는 무의미함
fit6=lm(math$grade~math$gender+math$attendance+math$homework)
summary(fit6)



# fit7에서 모든 계수가 fit6과 동일하지만 intercept만 다름
# fit7에서 intercept는 gender, attendence, homework = 0인 학생이 받을 거라고 예상되는 점수
# fit7에서 attendence, homework = 0은 평균적으로 출석한 학생, 숙제점수에서 평균을 받은 학생임
# fit7에서 interceop는 평균적으로 출석한 학생, 평균 숙제점수를 받은 학생이 받을 것으로 예상되는 점수

A <- math$attendance - mean(math$attendance) # A는 각 학생들의 출석점수가 평균 출석점수에서 벗어난 정도
H <- math$homework - mean(math$homework)     # H는 각 학생들의 숙제점수가 평균 숙제점수에서 벗어난 정도
A                                            # attendence = 0이면 출석점수와 평균 출석 점수가 동일
H                                            # homework - 0이면 숙제점수가 평균 숙제 점수와 동일

fit7 <- lm(math$grade ~ math$gender + A + H)
summary(fit7)















