## 상품명 기반 군집화 

### 데이터셋
상품 데이터 https://archive.ics.uci.edu/dataset/837/product%2Bclassification%2Band%2Bclustering

### 1. 데이터 로드 및 탐색

**문제 1-1**

`pricerunner_aggregate.csv` 파일을 읽고 `Product Title` 컬럼의 상위 5개를 출력하시오.

**문제 1-2**

상품명이 비어 있거나 결측치인 행이 있는 경우, 해당 행은 삭제하시오.

---

### 2. 텍스트 전처리

**문제 2-1**

모든 상품명을 소문자로 변환하고, 알파벳과 숫자를 제외한 문자는 모두 제거하여 `clean_title` 컬럼으로 저장하시오.

(힌트: 적절한 정규표현식을 사용해보세요.)

---

### 3. TfidfVectorizer 벡터화

**문제 3-1**

`TfidfVectorizer(stop_words='english', max_features=1000)`를 사용하여 상품명을 벡터화하시오. 생성된 벡터의 크기(shape)를 출력하시오.

(힌트: TfidfVectorizer는 CountVectorizer처럼 단어를 숫자로 바꾸는 도구이지만, 단순 등장 횟수 대신 각 문서에서 단어가 얼마나 중요한지도 함께 반영한다.
즉, 여러 상품명에 공통으로 자주 등장하는 단어의 영향은 줄이고, 특정 상품명을 더 잘 구분해주는 단어에 더 높은 가중치를 준다.
여기서 stop_words='english'는 의미가 약한 영어 불용어를 제거하라는 뜻이고, max_features=1000은 중요한 단어를 최대 1000개까지만 사용하라는 뜻이다.)

---

### 4. 최적 클러스터 수 결정 (Silhouette Score)

**문제 4-1**

KMeans를 사용하여 군집 수를 2~10까지 변화시키며 군집화를 수행하고, Silhouette Score를 계산하시오.

(힌트: `silhouette_score(X, labels)` 사용)

**문제 4-2**

각 클러스터 수에 대한 Silhouette Score를 시각화하여 최적의 클러스터 수를 선택하시오.

---

### 5. KMeans 클러스터링

**문제 5-1**

선택한 최적 클러스터 수를 기준으로 KMeans를 수행하고, 결과를 `df['cluster']` 컬럼에 저장하시오.

---

### 6. 2차원 시각화 (보너스)

**문제 6-1**

PCA를 사용하여 벡터를 2차원으로 축소하고, 클러스터별 색을 다르게 하여 시각화하시오.


