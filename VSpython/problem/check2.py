# 상품정보 product
# 이름    가격    재고
# 키보드  30000   100
# 모니터  100000  10
# 노트북  500000  2

# 딕셔너리 자료형으로 정의하고 모니터의 가격을 출력하시오

product = {
    'Keyboard': {'price': 30000, 'inventory': 100},
    'monitor': {'price': 100000, 'inventory': 10},
    'laptop': {'price': 500000, 'inventory': 2}
}


print("모니터 가격:", product['monitor']['price'])
