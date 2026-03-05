'''
파일 읽기 메소드 비교
큰 파일은 for-line이 메모리 효율이 좋아서 실무에서 자주 사용한다.
(나머지 메소드는 파일 전체를 메모리에 올려서 사용한다.)
'''

from paths import DATA_DIR

#_ 로 시작하는 함수는 "private 함수로 간주한다" (외부에서 사용하지 말라는 의미)
def _prepare_sample_file():
    '''
    읽기 메소드를 비교를 위해 샘플 파일을 생성하는 함수
    '''

    path = DATA_DIR / "read_methods.txt"
    with open(path,"w", encoding="utf-8") as f:
        f.writelines([f"{i}번째 줄\n" for i in range(1,6)])
    return path


def demo_read_methods():
    path =_prepare_sample_file()


    # read(): 전체를 문자열로
    with open(path, "r", encoding="utf-8") as f:
        all_text= f.read()
    print("all_text :", all_text)

    # readline() : 한줄씩
    with open(path, "r", encoding="utf-8") as f:
        first= f.readline()
        second = f.readline()
    print("all_text :", first, "second :", second)

    #readlines() : 전체를 줄 리스트로 
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()
    print("lines :", lines)

    #for-line: 한 줄씩 순회
    print("for-line 순회")
    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            print(" ", line.strip())
 