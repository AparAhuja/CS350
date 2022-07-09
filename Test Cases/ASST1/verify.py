def sy2(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "sy2" in t.name]
    assert len(mytests) == 3
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: sy2")

            if "Operation took" in res[i+1]:
                cmts.add("The output of sy2 is empty.")

            elif "Operation took" in res[i+4]:
                if "lock test done" in str(res[i+3]).lower():
                    grade += 2
                else:
                    cmts.add("The output of sy2 is wrong:")
                    cmts.add(res[i+1])
            else:
                cmts.add("The output of sy2 is too long or incorrect.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test sy2", grade, ",".join(cmts))

def sy3(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "sy3" in t.name]
    assert len(mytests) == 3
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: sy3")
            end = res.index("CV test done")

            if "Operation took" in res[i+1]:
                cmts.add("The output of sy3 is empty.")

            elif "CV test done" in res:
                counter = 31
                iterations = 5
                for entry in res[i+3:end-1]:
                    if int(entry.lower().split()[1]) == counter:
                        counter-=1

                    if counter == 0:
                        counter = 31
                        iterations-=1
                
                if iterations == 0:
                    grade+=2
            else:
                cmts.add("The output of sy3 is incorrect.")

        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test sy3", grade, ",".join(cmts))

def uw1(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "uw1" in t.name]
    assert len(mytests) == 3
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: uw1")

            if "Operation took" in res[i+1]:
                cmts.add("The output of uw1 is empty.")
            elif "Operation took" in res[i+6]:
                if "test succeeded" in str(res[i+3]).lower():
                    grade += 2
                else:
                    cmts.add("The output of uw1 is wrong:")
            else:
                cmts.add("The output of uw1 is too long or incorrect.")

        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test uw1", grade, ",".join(cmts))

RUBRIC = {
    sy2: 6,
    sy3: 6,
    uw1: 6,
}
