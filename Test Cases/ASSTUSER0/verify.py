def proper_errors(tests, helpers):
    try:
        cmts = set()
        tests_names = ["hi_lt_low", "too_hi", "too_low", "too_both"]
        errors = [ t for t in tests if t.name in tests_names ]
        grade = 0
        for e in errors:
            # Get the last line the split on the =
            err = int(e.results().split('\n')[-1].split('=')[1])
            if err != 1:
                cmts.add("Issue with exit code of test({})".format(e.name))
            else:
                grade += 0.5

        correct = [t for t in tests if t.name == "normal"][0]
        err = int(correct.results().split('\n')[-1].split('=')[1])
        if err != 0:
            cmts.add("Issue with exit code of test({})".format(correct.name))
        else:
            grade += 0.5
    except:
        cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Proper Error handling", grade, ",".join(cmts))


def vals(res):
    return [ int(t.strip()) for t in res.split('\n') if t != "" ]

def is_random(tests, helpers):
    try:
        grade = 0
        cmts = set()
        test = [t for t in tests if t.name == "randomness"][0]
        res = test.results().split("CHECK")
        one = vals(res[0])
        two = vals(res[1])
        if one[0] != len(one) - 1:
            cmts.add("Not enough or two few generated random numbers")
        else:
            grade += 0.5

        if two[0] != len(two) - 1:
            cmts.add("Not enough or two few generated random numbers")
        else:
            grade += 0.5

        different = False
        for i, x in enumerate(one):
            if x != two[i]:
                different = True
        if different:
            grade += 2.5
        else:
            cmts.add("Two identical sets of numbers when generating random numbers")

        one = one[1:]
        one.sort()
        if one[0] < -100:
            cmts.add("Lo bound not upheld")
        else:
            grade += 1
        if one[-1] > 100:
            cmts.add("Hi bound not upheld")
        else:
            grade += 1
    except:
        cmts.add("Cannot parse assignment log - likely an error in your assignment")


    return ("Random and Bounds", grade, ",".join(cmts))

USER_REPORTED_SPEED_MAX = 20000
TIME_REPORTED_SPEED_MAX = 50000

def is_sorted(tests, helpers):
    try:
        cmts = set()
        grade = 0
        test = [t for t in tests if t.name == "sort"][0]
        res = test.results().split('\n')
        before = int(res[0].split("=")[1])
        after = int(res[2].split("=")[1])
        one = vals("\n".join(res[3:]))
        if one[0] != len(one) - 1:
            cmts.add("Not enough or two few generated random numbers for sort")
        else:
            grade += 0.5
        
        x = sorted(one[1:])
        is_srt = True
        for i, t in enumerate(one[1:]):
            if t != x[i]:
                cmts.add("Values not sorted!")
                is_srt = False
                break

        if is_srt:
            grade += 0.5
        try:
            time_taken = int(res[1].split("=")[1])
            if time_taken < USER_REPORTED_SPEED_MAX:
                grade += 1.0
            else:
                cmts.add("Sorting algorithm too slow (user reported)");
        except:
            cmts.add("Improperly formated time, please just output time in microseconds to stdout")

    except:
        cmts.add("Cannot parse assignment log - likely an error in your assignment")

    return ("Is it sorted and fast enough?", grade, ",".join(cmts))

RUBRIC = {
    proper_errors: 2.5,
    is_random: 5.5, 
    is_sorted: 2,
}
