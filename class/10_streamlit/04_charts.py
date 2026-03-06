import streamlit as st
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import platform  # (추가) OS 구분용


st.title("04. 차트")

months = pd.date_range("2024-01-01", periods=12, freq="ME")
sales = np.random.randint(20000, 50000, size=12)

df = pd.DataFrame({
    "월": months.strftime("%Y-%m"),
    "매출": sales
})

st.subheader("1) st.line_chart()")
st.line_chart(df.set_index("월"))

st.subheader("2) st.bar_chart()")
st.bar_chart(df.set_index("월"))

# (추가) 한글 폰트 설정: OS별로 대표 폰트만 지정 (패턴 유지, 최소 변경)
# - Windows: Malgun Gothic(맑은 고딕)
# - macOS  : AppleGothic(기본 한글 폰트 계열)
# - Linux  : NanumGothic(설치돼 있으면 사용)
os_name = platform.system()
if os_name == "Windows":
    plt.rcParams["font.family"] = "Malgun Gothic"
elif os_name == "Darwin":  # macOS
    plt.rcParams["font.family"] = "AppleGothic"
else:  # Linux 등
    plt.rcParams["font.family"] = "NanumGothic"

plt.rcParams["axes.unicode_minus"] = False  # 마이너스 기호 깨짐 방지

fig, ax = plt.subplots()    # fig : 전체 그림, ax : 실제 차트 그리는 영역
ax.plot(df["월"], df["매출"], marker="o")   # x축, y축, 점 표시
ax.set_title("월별 매출(예시)")
ax.set_xlabel("월")
ax.set_ylabel("매출")
plt.xticks(rotation=45) # x축 레이블이 겹치지 않도록 45도 회전

st.pyplot(fig, width="stretch")