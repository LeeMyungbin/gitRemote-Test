import streamlit as st

st.title("05. 입력 위젯 기본")

st.subheader(" 1) 선택형 위젯")
agree = st.checkbox("동의합니다.", value=False)
mode = st.radio("모드 선택", ["기본", "고급","실험"])
tags = st.multiselect("관심 태그 ",["Python","stramlit",""])
level = st.selectbox("난이도", ["입문","초급", "중급"])
is_on =st.toggle("기능 활성화", value=True)

st.write("agree:", agree)
st.write("mode:", mode)
st.write("tags:", tags)
st.write("level:", level)
st.write("is_on:", is_on)

st.divider()

st.subheader( "2) 입력형 위젯")
name = st.text_input("이름", value="홍길동")
age= st.number_input("나이", min_value=0, max_value=120, vlaue=40)
st.write("name:")


st.subheader(" 3) 슬라이더")
score = st.slider(" 점수", min_value=0, max_value=100, value=50)
st.write("score:",score)