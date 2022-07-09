def a2q1(tests, helpers):
    try:
        grade = 0
        cmts = set()
        tests = [t for t in tests if "a2q1" in t.name]
        error_messages = ""
        for t in tests:
            # get the lines from the output
            l = t.results().split("\n")

            failed_tests = [s for s in l if "fails" in s]

            for entry in failed_tests:
                cmts.add(entry)

            grade = int(l[-1].split(":")[1].strip().split("/")[0])

    except:
        cmts.add("Cannot parse assignment log - likely an error in your assignment.")

    return ("a2q1 Tests", grade, ",".join(cmts))

def a2q2(tests, helpers):
    try:
        grade = 0
        cmts = set()
        tests = [t for t in tests if "a2q2" in t.name]
        for t in tests:
            # get the lines from the output
            l = t.results().split("\n")

            failed_tests = [s for s in l if "fails" in s]

            for entry in failed_tests:
                cmts.add(entry)

            grade = int(l[-1].split(":")[1].strip().split("/")[0])

    except:
        cmts.add("Cannot parse assignment log - likely an error in your assignment.")

    return ("a2q2 Tests", grade, ",".join(cmts))

RUBRIC = {
    a2q1: 6,
    a2q2: 6
}
