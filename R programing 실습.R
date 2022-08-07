# ------------------------------------------------------------------------
# 기본조작 명령어와 수학 함수 6pt

# %/% : 나눗셈 몫
# %% : 나눗셈 나머지
# ** : 거듭제곱

# -----------------------------------------------------------------------
# 변수 다루기와 기본 명령어   7pt~11pt
  
# (k <- 3) : ()로 감싸면, 수행후 결과를 자동으로 보여준다.

# cat() : Concatenate and Print
# cat("i love you") : 문자열을 표시한다.



# sink
# sink("3주차 실습코드.txt") 
  # "3주차 실습코드.txt"를 새롭게 만들어 줍니다.
# cat("i love you") : "i love you" console창에 표시되지 않고 "3주차 실습코드.txt"에 저장됩니다.
# sink() : 다시 원위치합니다.



# View(iris) : 데이터를 별도의 윈도우에 보여줍니다.
# summary(iris) : 데이터의 기본 통계량을 보여줍니다. 



# data() : R의 기본 내장데이터 셋에 있는 데이터를 불러옵니다.
  # data(iris) : iris 데이터를 불러옵니다.

# attach() : 데이터를 R 검색경로에 추가하여 변수명으로 바로 접근 가능하게 합니다.
  # attach(iris) : iris데이터셋을 고정합니다.
  # search()로 현재 메모리에 적재된 패키지에 iris가 설치된 것을 확인합니다.
  # attach(iris)를 실행하기 전에는 Sepal.Width는 오류가 떴지만 이제는 제대로된 반환값이 나옵니다.

# detach() : 데이터를 R 검색경로에서 제거합니다.

# > search()
# [1] ".GlobalEnv"        "tools:rstudio"    
# [3] "package:stats"     "package:graphics" 
# [5] "package:grDevices" "package:utils"    
# [7] "package:datasets"  "package:methods"  
# [9] "Autoloads"         "package:base"     
# > attach(iris)
# > search()
# [1] ".GlobalEnv"        "iris"             
# [3] "tools:rstudio"     "package:stats"    
# [5] "package:graphics"  "package:grDevices"
# [7] "package:utils"     "package:datasets" 
# [9] "package:methods"   "Autoloads"        
# [11] "package:base"     
# > detach(iris)
# > search()
# [1] ".GlobalEnv"        "tools:rstudio"    
# [3] "package:stats"     "package:graphics" 
# [5] "package:grDevices" "package:utils"    
# [7] "package:datasets"  "package:methods"  
# [9] "Autoloads"     



# levels(part) : part데이터의 종류를 파악합니다.
  # part 데이터는 factor형 데이터입니다. 
  # > levels(part)
  # [1] "L" "M" "H"
  # factor : 벡터의 특수한 형태이며 범주형 데이터를 다룹니다.

# str(part) : part데이터의 구성정보를 요약해서 보여줍니다.

# ordered(part2) : part2 데이터를 정렬합니다. 

# -----------------------------------------------------------
# R의 기본 > 데이터 타팁 > 벡터    14pt

# rnorm(30) : 30개의 정규분포를 따르는 난수를 생성합니다.

# order() : 데이터 값을 정렬한 다음에 위치 인덱스 반환합니다.
  # 데이터 값의 정렬한 다음에 데이터 값의 위치 인덱스를 반환합니다.
  # 기본은 오름차순입니다.
  # order(x, decreasing = TRUE) : 데이터값을 내림차순으로 정렬해서 위치 인덱스를 반환합니다.
  
# sort() : 데이터 값의 순서를 정렬해서 데이터 값을 반환합니다. 
  # 기본은 오름차순입니다.
  # sort(x, decreasing = TRUE)

# mean(x) : 데이터의 평균을 구합니다.
# range() : 데이터의 최소값과 최대값을 보여줍니다.
# sd() : 데이터의 표준편차를 구합니다.
# length() : 데이터의 길이를 구합니다.



# ----------------------------------------
# R의 기본 > 데이터 타입 > 벡터                18pt

# 문자열 조작 함수

# charmatch() : 문자열 부분 매칭
  # > var <- c("data", "meta", "sata")
  # > charmatch("me", var)
  # [1] 2

# chartr(old, new, x) : 문자 치환
  # old : 바꾸고 싶은 문자
  # new : 바꿔주는 문자
  # x : 찾아서 바꿀 문자열

# nchar() : 문자열의 글자수를 세어줍니다.
  # length() : 벡터의 길이를 구해줍니다. 즉 벡터의 원소 개수를 세어줍니다.

# strsplit(string, split = " ") : 문자열을 나눠서 리스트 형태로 반환합니다.










