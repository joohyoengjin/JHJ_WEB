# 1kg => 1000g
# 무게단위
# g 1000
# ton 0.001
# pound 2.204

# 입력: 100(kg) ton
# 출력: 0.1


def kg_to_g(kg):
    return kg * 1000

def kg_to_ton(kg):
    return kg * 0.001

def kg_to_pound(kg):
    return kg * 2.204

kg = float(input("kg 입력: "))

grams = kg_to_g(kg)
ton = kg_to_ton(kg)
pound = kg_to_pound(kg)

print("출력:")
print(f"{grams} g")
print(f"{ton} ton")
print(f"{pound} pound")