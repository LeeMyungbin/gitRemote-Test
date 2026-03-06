import streamlit as st

st.title("01. 출력 : text /write / markdown")

st.divider()

#st.text() :정말 그대로 찍고 싶을때
st.subheader("1 st.text()")
st.text("Hello, World!")
st.text("**굵게 표시** 안됨(마크다운 랜더링x)")


#st.write() : 다목적(문자열/숫자/리스트/딕셔너리/표/그래프 등)
st.subheader(" 2) st.write()")
st.write("문자열은 화면에서 보기 좋게 랜더링 되는 경우가 많다.")
st.write(123)
st.write(["apple","banana","cherry"])
st.write({"name": "홍길동", "age":25})

st.divider()

#st.markdown() :마크다운 문법 사용
st.subheader("3) st.markdown()")
st.markdown("""
# 제목
## 부제목
- 목록1
- 목록2
""")