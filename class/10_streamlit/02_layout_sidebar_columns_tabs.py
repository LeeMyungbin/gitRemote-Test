import streamlit as st

st.title("02. 래이아웃 : sidebar / columns / tabs / expander")

st.sidebar.header("사이드바 영역")
region = st.sidebar.selectbox("지역 선택", ["전체","서울", "부산","대구"])
show_detail=st.sidebar.checkbox("상세 정보 보기", vlaue=True)

st.write("사이드바에서 고른 지역:",region)
st.divider()

st.subheader(" 1) colums : 화면을 가로로 분할")
col1, col2, col3 = st.columns(3)

with col1:
    st.metric("오늘 방문자", "1,234", "+5%")
with col2:
    st.metric("주문 수", "210", "-2%" )
with col3:
    st.metric("매출", "3,200,000", "+12%")


st.divider()

st.subheader(" 2) tabs : 탭으로 화면 전환")
tab_a, tab_b = st.tabs(["요약","상세"])

with tab_a:
    st.write("요약 탭입니다.")
with tab_b:
    st.write("상세 탭입니다.")

st.divider()

st.subheader("3) expander: 접었다 펼치는 영역")
with st.expander("클릭해서 펼치기"):
    st.write("설명, 도움말, 고급 옵션을 숨겨 놓을 때 유용하다.")

if show_detail:
    st.info("상세 정보 옵션이 켜져 있다.")
