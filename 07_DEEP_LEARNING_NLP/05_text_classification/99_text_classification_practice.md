# [실습문제] TMDB5000 장르 다중레이블 예측하기

https://www.kaggle.com/datasets/tmdb/tmdb-movie-metadata

데이터셋은 [여기](https://github.com/user-attachments/files/20791799/tmdb_5000_movies.csv)에서 다운로드하세요 :)

위 TMDB 영화 데이터를 활용하여 다음 요구사항을 차례로 구현하고, overview를 통해 genre 멀티라벨을 예측하는 모델을 완성하세요. 

1. 데이터셋을 불러오고, 장르 정보를 리스트로 변환하는 코드를 작성하시오.

2. 줄거리(overview) 결측치와 장르 없는 영화를 제거하는 코드를 작성하시오.

3. 장르 정보를 다중 레이블 이진화하고, 줄거리 텍스트를 TF-IDF 벡터로 변환하는 코드를 작성하시오.

4. 훈련/테스트 데이터로 분할 후, 다중 레이블 분류 모델을 학습하는 코드를 작성하시오.

5. 테스트 데이터에 대해 예측을 수행하고, 평가 결과(classification_report)를 출력하시오.

6. 아래의 줄거리를 입력하여 예측된 장르를 출력하시오.
`"In the future, a robot assassin is sent back in time to kill a woman."`
