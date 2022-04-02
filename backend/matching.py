import random
from collections import Counter


def matching(lower, upper, people):
    """
    Matching
        lower: int of lower bound
        upper: int of upper bound
        people: mapping of people to their interests
    """
    group_sizes = create_size(lower, upper, people)
    print('GROUP SIZES')
    print(group_sizes)
    people_demand = people_by_demand(people)
    print('PEOPLE_DEMAND')
    print(people_demand)
    people_sorted = list(demand_sort(people_demand))
    print('PEOPLE SORTED')
    print(people_sorted)
    groups = []
    while len(people_sorted) > 0:
        base = people_sorted.pop(0)
        group = [base]
        target_size = group_sizes.pop()
        # Per g
        while len(group) < target_size:
            found = False
            tangent = len(people[base])
            while not found:
                for i in range(len(people_sorted)):
                    person = people_sorted[i]
                    if matching_interests(base, person, people, tangent):
                        found = True
                        group.append(person)
                        base = person
                        people_sorted.pop(i)
                        break
                if tangent == 0:
                    if len(people_sorted) == 0:
                        break
                    person = people_sorted.pop(0)
                    group.append(person)
                    base = person
                tangent -= 1
        groups.append(group)
    return groups


def create_size(lower, upper, people):
    """
    Creates a list of all the group sizes
    """
    if lower == 0:
        lower = 1
    assert lower > 0 and upper > 0
    size = lower
    sizes = []
    people_left = len(people)
    while people_left:
        if people_left - size >= size or people_left == size:
            sizes.append(size)
            people_left -= size
        else:
            size += 1
    print(sizes)
    return sizes


def people_by_demand(people):
    """
    Creates a mapping of people to their demand
    """
    interest_popularity = {}
    for interests in people.values():
        for interest in interests:
            if interest not in interest_popularity.keys():
                interest_popularity[interest] = 1
            else:
                interest_popularity[interest] += 1
    people_demand = {}
    for person, interests in people.items():
        demand = 0
        for interest in interests:
            demand += interest_popularity[interest]
        people_demand[person] = demand
    return people_demand


def demand_sort(people_demand):
    """
    Creates a list of people sorted by demand
    """
    return {k: v for k, v in sorted(people_demand.items(), key=lambda item: item[1])}.keys()


def matching_interests(person1, person2, people, tangent):
    """
    Boolean depending on if the number of interests between 2 people add up to tangent
    """
    similarity = 0
    person1_interests = people[person1]
    person2_interests = people[person2]
    for interest in person1_interests:
        if interest in person2_interests:
            similarity += 1
    if similarity >= tangent:
        return True
    return False



def test_basic():
    people = {
        'a': [1, 2],
        'b': [2, 3],
        'c': [3, 4],
        'd': [4, 5],
        'e': [5, 6],
        'f': [6, 7],
        'g': [7, 8]
    }
    lower = 2
    upper = 5
    output = matching(lower, upper, people)
    print(output)


def test_outlier():
    people = {
        'a': [1, 2],
        'b': [2, 3],
        'c': [3, 4],
        'd': [4, 5],
        'e': [7, 6]
    }
    lower = 0
    upper = 5
    output = matching(lower, upper, people)
    print(output)


def test_more_interests():
    people = {
        'a': [1, 2, 5, 6, 8],
        'b': [2, 3, 10, 4, 5],
        'c': [3, 4, 9, 8, 7],
        'd': [4, 5, 1, 2, 3],
        'e': [7, 6, 9, 8, 10]
    }
    lower = 2
    upper = 5
    print(people)
    output = matching(lower, upper, people)
    print(output)


def rand_test():
    people = {}
    people_num = random.randrange(100)
    interest = random.randrange(2, 10)
    for i in range(people_num):
        interests = []
        possible_interest = []
        for k in range(20):
            possible_interest.append(k)
        for j in range(interest):
            a = random.choice(possible_interest)
            interests.append(a)
            possible_interest.remove(a)
        people[i] = interests
    print(people)
    lower = random.randrange(0, int(people_num/4))
    upper = random.randrange(lower, int(people_num/2))
    print(people_num)
    print(lower)
    print(upper)
    print("")
    output = matching(lower, upper, people)
    print(output)
    return people, output


#rand_test()


def checker(people, groups):
    outcome = {}
    for group in groups:
        outcome[str(group)] = {}
        for person1 in group:
            for person2 in group:
                if person1 == person2:
                    continue
                outcome[str(group)][str(str(person1) + "_" + str(person2))] = 0
                for interest in people[person1]:
                    if interest in people[person2]:
                        outcome[str(group)][str(str(person1) + "_" + str(person2))] += 1
        print(Counter(outcome[str(group)].values()))
    print(outcome)


checker({0: [5, 65, 78, 56, 48, 0, 52, 36], 1: [2, 46, 39, 53, 29, 42, 54, 44], 2: [44, 10, 2, 22, 16, 17, 95, 5], 3: [99, 25, 33, 21, 65, 51, 53, 32], 4: [95, 19, 20, 1, 56, 53, 82, 75], 5: [44, 64, 95, 98, 60, 3, 58, 91], 6: [94, 50, 77, 73, 49, 17, 69, 64], 7: [60, 64, 24, 59, 52, 99, 40, 10], 8: [63, 68, 44, 80, 7, 9, 26, 65], 9: [59, 83, 27, 14, 40, 65, 75, 9], 10: [66, 69, 56, 97, 73, 78, 88, 35], 11: [28, 30, 31, 42, 70, 52, 80, 14], 12: [58, 96, 53, 31, 12, 13, 67, 52], 13: [18, 35, 21, 74, 7, 44, 50, 86], 14: [17, 25, 88, 59, 15, 23, 38, 26], 15: [85, 71, 20, 35, 19, 30, 67, 56], 16: [88, 2, 59, 17, 24, 68, 81, 21], 17: [32, 49, 79, 90, 1, 35, 15, 14], 18: [74, 78, 9, 15, 7, 18, 65, 81], 19: [15, 10, 12, 86, 66, 65, 46, 96], 20: [9, 28, 37, 89, 8, 84, 3, 56], 21: [32, 83, 12, 3, 65, 13, 42, 97], 22: [41, 9, 54, 82, 36, 48, 33, 37], 23: [76, 32, 31, 4, 55, 85, 45, 74], 24: [95, 4, 41, 32, 68, 47, 55, 14], 25: [34, 25, 63, 18, 46, 58, 11, 90], 26: [49, 98, 14, 1, 99, 56, 7, 77], 27: [15, 91, 5, 2, 9, 54, 83, 66], 28: [49, 37, 56, 54, 18, 47, 58, 79], 29: [40, 0, 66, 2, 93, 53, 27, 87]}, [[23, 11, 15], [6, 14, 25], [22, 20, 5], [29, 7, 12], [24, 2, 16], [1, 4, 10], [13, 3, 21], [19, 0, 26], [17, 28, 27], [8, 9, 18]])


def complete_test():
    a = rand_test()
    checker(a[0], a[1])


complete_test()
