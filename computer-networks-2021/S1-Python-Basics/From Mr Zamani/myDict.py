

major = {'pooya': 'electronic', 'omid': 'philosophy', 'sara': 'art', 'niki': 'economy'}

print(major['niki'])
major['omid'] = 'politics'  # you can add new items easily

if 'economy' in major.values():
    print("niki major: {}".format(major['niki']))

for a, b in major.items():
    print(a, b)

print(major.values())