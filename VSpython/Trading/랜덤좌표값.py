import random
import math

def calculate_distance(point):
    x, y = point
    return math.sqrt((x - 5)**2 + (y - 5)**2)

def generate_and_sort_coordinates():
    coordinates = [(random.uniform(0, 10), random.uniform(0, 10)) for _ in range(20)]
    sorted_coordinates = sorted(coordinates, key=calculate_distance)
    return sorted_coordinates

if __name__ == "__main__":
    sorted_coords = generate_and_sort_coordinates()

    print("중심좌표 (5, 5) 에 가까운 좌표를 순서대로 :")
    for coord in sorted_coords:
        print(coord)
