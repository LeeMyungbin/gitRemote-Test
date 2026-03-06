from pathlib import Path

def demo_else_finally_file():
    """
    finally는 파일/네트워크 같은 자원을 반드시 정리해야 할 때 사용한다.
    다만 보통 with문이 더 안전해서 finally는 "원리 이해"정도로만 알아두면 된다.
    """
    no_such = Path("data") / "no_file.txt"
    f = None
    try:
        f = open(no_such, "r", encoding="utf-8")
    except FileNotFoundError as e:
        print("[except] 파일 없음 : ", e.filename)
    else:
        # 예외가 없을 때만 실행 되는 구문
        first = f.readline().rstrip("\n")
        print("[else] 첫 줄 :", first)
    finally:
        # 예외 발생 여부와 무관하게 실행 되는 구문 (사용 했던 리소스 정리 작업)
        if f is not None and not f.closed:
            f.close()
        print("[finally] 파일 핸들 정리 완료")

class ScoreRangeError(Exception):
    """점수 범위(0~100) 위반을 나타내는 사용자 정의 예외"""

def validate_score(score):
    """
    - 타입이 숫자가 아니면 TypeError
    - 범위가 0~100이 아니면 ScoreRangeError
    """
    if not isinstance(score, (int, float)):
        raise TypeError("점수는 숫자여야 합니다.")
    if not (0 <= score <= 100):
        raise ScoreRangeError("점수는 0~100 사이여야 합니다.")

def to_grade(score):
    # 전달 받은 숫자의 유효성 검사를 먼저 수행
    validate_score(score)

    if score >= 90:
        return "A"
    elif score >= 80:
        return "B"
    elif score >= 70:
        return "C"
    elif score >= 60:
        return "D"
    else:
        return "F"
    
def demo_raise_custom_exception():
    samples = [95, -3, 101, 72.5, "88"]
    
    for s in samples:
        try:
            g = to_grade(s)
            print(f"[ok] {s} -> {g}")
        except (TypeError, ScoreRangeError) as e:
            print(f"[bad] {s} -> {type(e).__name__}")