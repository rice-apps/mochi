

def main():
    # TODO: something to schedule this task periodically
    people = query_people()
    lower, upper = query_lower_upper()
    groups = matching(lower, upper, people)
    # TODOadd back into database


def matching(lower, upper, people):
    """
    Matching
        lower: int of lower bound
        upper: int of upper bound
        people: mapping of people to their interests
    """
    group_sizes = create_size(lower, upper, people).sort()
    people_demand = people_by_demand(people)
    people_sorted = demand_sort(people_demand)
    groups = []
    while len(people_sorted) > 0:
        base = people_sorted.pop(0)
        group = []
        current_size = 0
        target_size = group_sizes.pop()
        while current_size < target_size():
            found = False
            tangent = 0
            while not found:
                for person in people.keys():
                    if matching_interests(base, person, people, tangent):
                        found = True
                        group.append(person)
                        base = person
                tangent += 1
        groups.append(group)
    return groups


def query_people():
    """
    Creates a mapping by pulling every person attending the event
    FORMAT OF THE MAPPING IS {NETID : [INTEREST1, INTERST2, INTERST3, ETC.]}
    """


def query_lower_upper():
    """
    Creates a tuple of lower and upper for an event from the database:
    """


def create_size(lower, upper, people):
    """
    Creates a list of all the group sizes
    """
    assert lower >= 0 and upper > 0
    size = lower
    sizes = []
    people_left = len(people)
    while people_left:
        if people_left - size >= size:
            sizes.append(size)
            people_left -= size
        else:
            size += 1
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
        people_demand[people] = demand
    return people_demand


def demand_sort(people_demand):
    """
    Creates a list of people sorted by demand
    """
    return {k: v for k, v in sorted(x.items(), key=lambda item: item[1])}.keys()


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
    
