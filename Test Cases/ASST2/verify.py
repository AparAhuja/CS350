def onefork(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "onefork" in t.name]
    assert len(mytests) == 3
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/onefork")
            if "Operation took" in res[i+1]:
                cmts.add("The output of onefork is empty.")
            elif "Operation took" in res[i+2]:
                if res[i+1] == "PC" or res[i+1] == "CP":
                    grade += 2
                else:
                    cmts.add("The output of onefork is wrong:")
                    cmts.add(res[i+1])
            elif "Operation took" in res[i+3]:
                if (res[i+1] == "P" and res[i+2] == "C") or (res[i+1] == "C" and res[i+2] == "P"):
                    grade += 2
                else:
                    cmts.add("The output of onefork is wrong:")
                    cmts.add(res[i+1])
                    cmts.add(res[i+2])
            else:
                cmt.add("The output of onefork is too long.")
        except:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test onefork", grade, ",".join(cmts))

def pidcheck(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "pidcheck" in t.name]
    assert len(mytests) == 3
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/pidcheck")
            pids = {}
            pid_names = ["C", "PC", "PP"]
            error = False
            if "Operation took" in res[i+4]:
                for j in [1, 2, 3]:
                    entry = res[i+j].split(":")
                    k = entry[0].strip()
                    v = int(entry[1].strip())
                    # print("({}, {})".format(k, v))
                    if k in pids:
                        error = True
                        cmts.add("Duplicate pid output of {}".format(k))
                    if not k in pid_names:
                        error = True
                        cmts.add("Unknown pid name: {}".format(k))
                    elif v <= 0:
                        error = True
                        cmts.add("The value of {} must be positive: {}".format(k, v))
                    else:
                        pids[k] = v

                if not error and len(pids) != 3:
                    error = True
                    cmts.add("The number of pids are wrong: {}".format(list(pids.keys())))
                
                if not error: 
                    if pids["C"] == pids["PC"] and pids["C"] != pids["PP"]:
                        grade += 2
                    else:
                        grade += 1
                        cmts.add("pids are not match")
            else:
                cmts.add("The length of output is wrong.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test pidcheck", grade, ",".join(cmts))

def widefork(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "widefork" in t.name]
    assert len(mytests) == 3
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/widefork")
            j = 1
            s = []
            while not "Operation took" in res[i+j]:
                for c in res[i+j].strip():
                    s.append(c)
                j = j + 1

            P_num = 0 
            A_num = 0
            B_num = 0
            C_num = 0
            a_num = 0
            b_num = 0
            c_num = 0
            x_num = 0
            error = False
            for c in s:
                if c == 'P':
                    P_num = P_num + 1
                    if P_num > 3:
                        error = True
                        cmts.add("Too many P")
                        break
                elif c == 'A':
                    if P_num == 0:
                        error = True
                        cmts.add("A must be preceded by one P")
                        break
                    elif A_num == 1:
                        error = True
                        cmts.add("There should be one A only.")
                        break
                    else:
                        P_num -= 1
                        A_num = 1
                elif c == 'B':
                    if P_num == 0:
                        error = True
                        cmts.add("B found but not enough P's (should be at LEAST 2)")
                        break
                    elif B_num == 1:
                        error = True
                        cmts.add("There should be one B only.")
                        break
                    else:
                        B_num = 1
                        P_num -= 1
                elif c == 'C':
                    if P_num == 0:
                        error = True
                        cmts.add("C found but not enough P's (should be at LEAST 3)")
                        break
                    elif C_num == 1:
                        error = True
                        cmts.add("There should be one C only.")
                        break
                    else:
                        C_num = 1
                        P_num -= 1
                elif c == 'a':
                    if A_num != 1:
                        error = True
                        cmts.add("a must be preceded by A")
                        break
                    elif a_num != 0:
                        error = True
                        cmts.add("There should be one a only.")
                        break
                    else:
                        a_num = 1
                elif c == 'b':
                    if B_num != 1:
                        error = True
                        cmts.add("b must be preceded by B")
                        break
                    elif b_num != 0:
                        error = True
                        cmts.add("There should be one b only.")
                        break
                    else:
                        b_num = 1
                elif c == 'c':
                    if C_num != 1:
                        error = True
                        cmts.add("c must be preceded by C")
                        break
                    elif c_num != 0:
                        error = True
                        cmts.add("There should be one c only.")
                        break
                    else:
                        c_num = 1
                elif c == 'x':
                    x_num = x_num + 1
                else:
                    error = True
                    cmts.add("Wrong output: {}".format(c))
                    break
            
            if error:
                cmts.add("Incorrect output: {}".format("".join(s)))
            elif P_num == 0 and A_num == 1 and B_num == 1 and C_num == 1 and len(s) == 9 and x_num > 0:
                grade += 2
                cmts.add("Partial correct output: {}".format("".join(s)))
            elif a_num == 1 and b_num == 1 and c_num == 1 and len(s) == 9:
                grade += 3
            else:
                cmts.add("Incorrect output: {}".format("".join(s)))
        except Exception as e:
            print(e)
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test widefork", grade, ",".join(cmts))

def forktest(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "forktest" in t.name]
    assert len(mytests) == 3
    for test in mytests:      
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p testbin/forktest")
            if "Starting." in res[i+1] and \
                "Complete." in res[i+3] and \
                "Operation took" in res[i+4] :
                s = res[i+2].strip()
                if len(s) != 30:
                    cmts.add("Wrong output length: {}".format(s))
                elif s.count('0') == 2 and \
                    s.count('1') == 4 and \
                    s.count('2') == 8 and \
                    s.count('3') == 16:
                    grade += 3
                else:
                    cmts.add("Wrong output: {}".format(s))
            else:
                cmts.add("Wrong output format.")
        except Exception as e:
            print(e)
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test forktest", grade, ",".join(cmts))

RUBRIC = {
    onefork: 6,
    pidcheck: 6,
    widefork: 9,
    forktest: 9,
}
