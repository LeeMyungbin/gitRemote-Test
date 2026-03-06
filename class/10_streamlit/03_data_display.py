import streamlit as st
import pandas as pd

st.title("03. 데이터 표시")

rows = [
    {"제품": "노트북","판매량":12,"성장률(%)":8.5},
    {"제품": "모니터","판매량":5,"성장률(%)":2.0},
    {"제품": "키보드","판매량":7,"성장률(%)":3.1}
]
df=pd.DataFrame(rows)

st.subheader("1) st.dataframe(): 대화형 테이블(정렬/스크롤 등)")
st.dataframe(df)

st.subheader("2) st.table() :정적 테이블 (가볍고 단순)")
st.table(df)
total_sales = int(df["판매량"].sum())
st.metric("총 판매량", total_sales,"+2(예시)")

st.subheader("3) st.json() : JSON 데이터 예쁘게 표시")
payload ={
    "region" : "서울" ,
    "summary" : {"total_sales" : total_sales, "top_product" : "노트북"}
}
st.json(payload, expanded=True)