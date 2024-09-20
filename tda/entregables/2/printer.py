skilines = [(85, 50), (40, 110), (25, 25)]

def printer(case, skilines_status):
    for i in range(1, case+1, 1):
        if skilines_status[i][0] >= skilines_status[i][1]:
            res = f"Case {i}. Increasing ({skilines_status[i-1][0]}). Decreasing ({skilines_status[i-1][1]})."
            print(res)
        else:
            res = f"Case {i}. Decreasing ({skilines_status[i-1][1]}). Increasing ({skilines_status[i-1][0]})."
            print(res)            