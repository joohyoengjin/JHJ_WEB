# 상품정보 : 가격, 상품명, 일련번호
prod = {'no':100, 
        'pname':'자전거', 
        'price':200000}
print(prod)

# 구체적인 값을 보고 싶다
print(prod.get('no'))

# 특정 속성에 대한 값을 변경하고 싶다
prod['no'] = 200
print(prod)