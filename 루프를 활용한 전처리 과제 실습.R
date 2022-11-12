# 1. transaction.csv 데이터를 이용하여 분야 별 지출 현황을 분석하고자 한다.

# 1.1 transaction.csv를 불러오시오.
data <- read.csv("C:/Users/wkdgu/Desktop/마빅/8주차/과제/transaction.csv")



# ------------------------------------------------------------
# 1.2. largecategory, midcategory, smallcategory 변수를 통하여 총 몇개의 분야가 존재하는 지 확인하시오.

category <- data.frame(data$largecategory, data$midcategory, data$smallcategory)

colnames(category) <- c("cat1", "cat2", "cat3")

category <- category[order(category$cat1, category$cat2, category$cat3),]

# 3개의 카테고리가 모두 겹치는 행은 삭제해줍니다.
category <- category[!duplicated(category[c("cat1", "cat2", "cat3")]),]  



#----------------------------------------------------------------------------
# 1.3 largecategory별 총 지출 금액을 확인하고 지출량에 따라 sort하시오.

# data를 largecategory를 기준으로 정렬한 다음에 cat_expenditure에 담아줍니다.
cat_expenditure <- data[order(data$largecategory),]
cat_expenditure

# ave(spentmoney,largecategory,FUN=sum)
# spentmoney를 largecategory별로 묶은 다음에 다 합해서 각각 원소에 largecategory별로 묶은 합을 반환해줍니다.

# ave(spentmoney,largecategory)
# spentmoney를 largecategory별로 묶은 다음에 largecategory별로 평균을 구해서 각각 원소에 평균을 반환해줍니다.

# cat_expenditure에서 largecategory별로 spentmoney의 합을 구한 다음에 tot_exp라는 새로운 칼럼을 생성해 각각의 원소에 합을 대입해 줍니다. 
cat_expenditure <- within(cat_expenditure, {tot_exp <- ave(spentmoney, largecategory, FUN=sum)})
cat_expenditure

# cat_expenditure에서 largecategory 칼럼을 따로 빼서 데이터프레임을 만들어 준다.
cat_expenditure[c("largecategory")]

# !duplicated()로 cat_expenditure에서 최초의 중복된 값을 제외하고 모두 FALSE로 만들어준다.
!duplicated(cat_expenditure[c("largecategory")])

# cat_expenditure[]로 인덱싱해 중복된 값을 모두 빼주는 인덱싱을 한다.
cat_expenditure=cat_expenditure[!duplicated(cat_expenditure[c("largecategory")]),]
cat_expenditure
str(cat_expenditure)

# cat_expenditure에서 largecatogory와 tot_exp를 제외하고는 모두 빼줍니다.
cat_expenditure <- data.frame(cat_expenditure$largecategory,cat_expenditure$tot_exp)
cat_expenditure

# cat_expenditure의 컬럼명을 "category", "expenditure"로 설정해줍니다.
colnames(cat_expenditure) <- c("category", "expenditure")
cat_expenditure

# cat_expenditure를 expenditure 기준으로 오름차순 정렬해줍니다. 
cat_expenditure <- cat_expenditure[order(cat_expenditure$expenditure),]
cat_expenditure



# -------------------------------------------------------------------------
# 1.4 transaction에서 largecategory별 총 거래횟수를 확인하고 이를 분야별 총지출 금액과 하나의 데이터 프레임에 담으시오.

# data를 largecategory 기준으로 오름차순 정렬한다음에 cat_freq 데이터프레임에 담습니다.
cat_freq <- data[order(data$largecategory),]
cat_freq

# cat_freq 데이터프레임에서 largecategory 칼럼과 모든 열이 1로 구성된 데이터프레임을 만들어 cat_freq에 담습니다.
cat_freq <- data.frame(cat_freq$largecategory,1)
cat_freq
str(cat_freq)

# cat_freq의 컬렴명을 "category", "index"로 설정해줍니다.
colnames(cat_freq) <- c("category", "index")

# category별로 index 개수의 합을 구한 다음에 freq라는 새로운 칼럼을 생성해서 각각의 원소에 category별 합을 넣어줍니다.
cat_freq <- within(cat_freq, {freq <- ave(index, category, FUN=sum)})

# cat_freq에서 category 칼럼을 따로 빼서 데이터프레임을 만듭니다.
# 중복된 행을 모두 제거하는 인덱싱을 해서 다시 cat_freq에 담아줍니다.
cat_freq <- cat_freq[!duplicated(cat_freq[c("category")]),]
cat_freq

# cat_freq에서 index 칼럼을 제거해줍니다.
cat_freq <- data.frame(cat_freq$category, cat_freq$freq)
cat_freq

# cat_freq의 칼럼명을 "category", "freq"로 바꿔줍니다.
colnames(cat_freq) <- c("category", "freq")
cat_freq

# cat_freq를 category 기준으로 오름차순 정렬해줍니다.
cat_freq <- cat_freq[order(cat_freq$category),]
cat_freq

# expenditure기준으로 정렬된 cat_expenditure를 category기준으로 정렬해줍니다.
cat_expenditure <- cat_expenditure[order(cat_expenditure$category),]
cat_expenditure

# cat_freq와 cat_expenditure를 합쳐서 cat_transaction을 만들어줍니다.

cat_transaction <- merge(cat_expenditure, cat_freq, by="category")
cat_transaction 



# ---------------------------------------------------------------
# 2. 위에서 했던 작업들을 loop문을 이용해 전처리합니다.

# 2.1 
# "1.2. largecategory, midcategory, smallcategory 변수를 통하여 총 몇개의 분야가 존재하는 지 확인하시오."를 loop를 이용해 수행합니다.

# data에서 largecategory, midcategory, smallcategory 칼럼을 빼네 category 데이터프레임을 만듭니다.
category <- data.frame(data$largecategory, data$midcategory, data$smallcategory)
category
str(category)
summary(category)
unique(category)

# category 데이터프레임의 컬럼명을 "cat1", "cat2", "cat3"로 지정해줍니다.
colnames(category) <- c("cat1", "cat2", "cat3")

# category를 cat1,cat2,cat3순으로 정렬합니다.
category <- category[order(category$cat1, category$cat2, category$cat3),]
category

k <- nrow(category) # k(category의 행 개수)는 342입니다.
index <- rep(0,k)    # 0을 342번 반복해서 index에 담아줍니다.

index[1] <- 1  # 인덱스 1번에 1을 담아줍니다. index는 1개의 1과 341개의 0을 가지고 있습니다.
index

# 3개의 칼럼값이 모두 똑같은 행을 제거해줍니다.
for(i in 2:k){
  if(category$cat1[i]!=category$cat1[i-1] | category$cat2[i]!=category$cat2[i-1] | category$cat3[i]!=category$cat3[i-1]){
    index[i] <- 1
  }
}
index
category <- category[index==1,]
category
str(category)




# 2.2 
# "1.3 largecategory별 총지출 금액을 확인하고 지출량에 따라 sort하시오."를 loop를 이용해서 수행합니다.
































