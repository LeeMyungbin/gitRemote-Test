'''
RuntimeException:실행 중 발생하는 예외. => 예외 처리
SyntaxError: 문법 에러, 실행 전에 코드 형식 자체가 틀림. => 예외 처리 대상 아님
'''




def demo_runtime_exception():
    # ZeroDivisionError : division by zero
    # print(10 / 0)
    

    #ValueError : invalid literal for int() with base 10:'abc"
    #print(int("abc"))  

    #TypeError: can only concatenate str (not "int") to str
    # print("abc" + 100)
  
    # IndexError: list index out of range
    # 1st=[1 ,2 ,3]
    # print(1st[10])

    # KeyError: 'age'
    # d={"name": "홍길동"}
    # print(d["age"])

    #예외가 발생하고 처리되지 않으면 이후 코드는 실행 되지 않음
    print("[demo_runtime_exception]")

def demo_try_except_basic():
    '''
    try/except 기본
    -try : 예외가 발생할 수도 있는 코드
    -except : 예외가 발생 했을 때 실행 되는 코드
    => 예외 발생을 처리 한 뒤 프로그램 정상 흐름으로 복귀
    '''
    a, b =10, 0
    try:
        result =a / b              # exception 발생 즉시 코드 중단 후 except 블럭으로 이동
        print("결과 :", result)

    except ZeroDivisionError as e:
        # e 안에는 예외 메세지가 담겨 있다.
        print(str(e))

    s="42원"
    try:
        num=int(s)
        print("num:", num)
    except ValueError:   # 에러 객체를 사용하지 않을 경우 생략 가능
        print("[except] 숫자만 변환 가능합니다.")
    
    # try/except 로 예외 처리 되어 프로그램 정상 구동
    print("[demo_try_exception_basic]")