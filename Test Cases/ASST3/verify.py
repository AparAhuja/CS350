import traceback

def argtest_long(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "argtest-long" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/argtest thisisalongishargthatisjustreallylongbecauseitislog short")

            if "Operation took" in res[i+1]:
                cmts.add("The output of argtest-long is empty.")

            elif "Operation took" in res[i+19]:
                operation_took_index = i + 19

                if ("argc:3" in res[i + 1].replace(" ", "") and
                    "argv[3] -> [NULL]" in res[operation_took_index - 1] and 
                    "argv[2] -> short" in res[operation_took_index - 2] and
                    "argv[1] -> thisisalongishargthatisjustreallylongbecauseitislog" in res[operation_took_index - 3] and
                    "argv[0] -> uw-testbin/argtest" in res[operation_took_index - 4]):
                        grade+=2
                else:
                    print('\n'.join(res))
                    cmts.add("The output of argtest-long is wrong:")
            else:
                cmts.add("The output of argtest-long is too long or incorrect.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test argtest-long", grade, ",".join(cmts))

def argtest_many(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "argtest-many" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/argtest 456 howaboutthis string and another yet again")

            if "Operation took" in res[i+1]:
                cmts.add("The output of argtest-many is empty.")

            elif "Operation took" in res[i+34]:
                operation_took_index = i + 34

                if ("argc:8" in res[i + 1].replace(" ", "") and
                    "argv[8] -> [NULL]" in res[operation_took_index - 1] and 
                    "argv[7] -> again" in res[operation_took_index - 2] and
                    "argv[6] -> yet" in res[operation_took_index - 3] and
                    "argv[5] -> another" in res[operation_took_index - 4] and
                    "argv[4] -> and" in res[operation_took_index - 5] and
                    "argv[3] -> string" in res[operation_took_index - 6] and
                    "argv[2] -> howaboutthis" in res[operation_took_index - 7] and
                    "argv[1] -> 456" in res[operation_took_index - 8]):
                        grade+=2
                else:
                    print(res)
                    cmts.add("The output of argtest-many is wrong:")
            else:
                cmts.add("The output of argtest-many is too long or incorrect.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test argtest-many", grade, ",".join(cmts))

def argtest_none(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "argtest-none" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/argtest")

            if "Operation took" in res[i+1]:
                cmts.add("The output of argtest-none is empty.")

            elif "Operation took" in res[i+13]:
                operation_took_index = i + 13

                if ("argc:1" in res[i + 1].replace(" ", "") and
                    "argv[1] -> [NULL]" in res[operation_took_index - 1] and 
                    "argv[0] -> uw-testbin/argtest" in res[operation_took_index - 2]):
                        grade+=2
                else:
                    print('\n'.join(res))
                    cmts.add("The output of argtest-none is wrong:")
            else:
                cmts.add("The output of argtest-none is too long or incorrect.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test argtest-none", grade, ",".join(cmts))

def argtesttest(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "argtesttest" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/argtesttest")

            if "Operation took" in res[i+1]:
                cmts.add("The output of argtesttest is empty.")

            elif "Operation took" in res[i+6]:
                operation_took_index = i + 6

                if ("argc:3" in res[i + 1].replace(" ", "") and
                    "argv[3]: [NULL]" in res[operation_took_index - 1] and 
                    "argv[2]: second" in res[operation_took_index - 2] and
                    "argv[1]: first" in res[operation_took_index - 3] and
                    "argv[0]: argtesttest" in res[operation_took_index - 4]):
                        grade+=4
                else:
                    print('\n'.join(res))
                    cmts.add("The output of argtesttest is wrong:")
            else:
                cmts.add("The output of argtesttest is too long or incorrect.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test argtesttest", grade, ",".join(cmts))

def hogparty(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "hogparty_custom_0" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/hogparty")

            if "Operation took" in res[i+1]:
                cmts.add("The output of hogparty is empty.")

            elif "Operation took" in res[i+4]:
                op_strs = res[i + 1] + res[i + 2] + res[i + 3]

                if op_strs.count('x') == 5 and op_strs.count('y') == 5 and op_strs.count('z') == 5:
                    grade+=9
                else:
                    print('\n'.join(res))
                    cmts.add("The output of hogparty is wrong:")
            elif "Operation took" in res[i+3]:
                op_strs = res[i + 1] + res[i + 2]

                if op_strs.count('x') == 5 and op_strs.count('y') == 5 and op_strs.count('z') == 5:
                    grade+=9
                else:
                    print('\n'.join(res))
                    cmts.add("The output of hogparty is wrong:")

            elif "Operation took" in res[i+2]:
                op_strs = res[i + 1]

                if op_strs.count('x') == 5 and op_strs.count('y') == 5 and op_strs.count('z') == 5:
                    grade+=9
                else:
                    print('\n'.join(res))
                    cmts.add("The output of hogparty is wrong:")
            else:
                cmts.add("The output of hogparty is too long or incorrect.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test hogparty", grade, ",".join(cmts))

def hogparty_many(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "hogparty-many_1mb" in t.name]
    success_count = 0
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = 0
            indices = []

            for result in res:
                if 'hogparty' in result:
                    indices.append(i)
                i+=1

            for index in indices:
                if "Operation took" in res[index+1]:
                    cmts.add("The output of hogparty-many is empty.")

                elif "Operation took" in res[index+4]:
                    op_strs = res[index + 1] + res[index + 2] + res[index + 3]

                    if op_strs.count('x') == 5 and op_strs.count('y') == 5 and op_strs.count('z') == 5:
                        success_count+=1

                elif "Operation took" in res[index+3]:
                    op_strs = res[index + 1] + res[index + 2]

                    if op_strs.count('x') == 5 and op_strs.count('y') == 5 and op_strs.count('z') == 5:
                        success_count+=1

                elif "Operation took" in res[index+2]:
                    op_strs = res[index + 1]

                    if op_strs.count('x') == 5 and op_strs.count('y') == 5 and op_strs.count('z') == 5:
                        success_count+=1

            if success_count == 5:
                grade += 3
            else:
                grade += 0
        
        except Exception as e:
            traceback.print_exc()
            cmts.add("Cannot parse assignment log - likely an error in your assignment")

    if grade == 0:
        cmts.add("The output of hogparty-many is too long or incorrect. Ran only {0}/5 times".format(success_count))

    return ("Test hogparty-many", grade, ",".join(cmts))

def widefork(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "widefork" in t.name]
    success_count = 0

    for test in mytests:
        try:
            res = test.results().split('\n')
            i = 0
            indices = []

            for result in res:
                if "OS/161 kernel: p uw-testbin/widefork" == result:
                    indices.append(i)
                i+=1

            for index in indices:
                if "Operation took" in res[index+1]:
                    cmts.add("The output of widefork is empty.")

                j = 1
                s = []

                while not "Operation took" in res[index+j]:
                    for c in res[index+j].strip():
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
                elif a_num == 1 and b_num == 1 and c_num == 1 and len(s) == 9:
                    success_count+=1
                else:
                    cmts.add("Incorrect output: {}".format("".join(s)))

            if success_count == 5:
                grade += 2
            else:
                grade += 0
        
        except Exception as e:
            traceback.print_exc()
            cmts.add("Cannot parse assignment log - likely an error in your assignment")

    if grade == 0:
        cmts.add("The output of widefork is too long or incorrect. Ran {0}/5 times".format(success_count))

    return ("Test widefork", grade, ",".join(cmts))

def romemwrite(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "romemwrite" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/romemwrite")

            if "Operation took" in res[i+1]:
                cmts.add("The output of romemwrite is empty.")

            if next((s for s in res if "IF THIS PRINTS, THE TEST FAILED" in s), None):
                cmts.add("romemwrite test has failed")

            elif "Operation took" in res[i+4]:
                if ("Trying to write to the text segment" in res[i + 1] and
                        "This program should fail if the text segment is read-only." in res[i + 2] and
                        "However, the kernel should not crash..." in res[i + 3]):
                    grade+=3

                if ("OS/161 kernel: q" in res[i + 5] and
                        "Shutting down." in res[i + 6] and 
                        "The system is halted." in res[i + 7]):
                    grade+=5

                else:
                    print('\n'.join(res))
                    cmts.add("The output of romemwrite is wrong:")
            else:
                cmts.add("The output of romemwrite is too long or incorrect.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test romemwrite", grade, ",".join(cmts))

def vm_crash2(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "vm-crash2" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/vm-crash2")

            if next((s for s in res if "IF THIS PRINTS, THE TEST FAILED" in s), None):
                cmts.add("romemwrite test has failed")

            elif ("Operation took" in res[i+1] and
                    "OS/161 kernel: q" in res[i + 2] and
                    "Shutting down" in res[i + 3]):
                grade+=8

            else:
                cmts.add("The output of vm-crash2 is too long or incorrect.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test vm-crash2", grade, ",".join(cmts))

def vm_data1(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "vm-data1_custom_0" == t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/vm-data1")

            if "Operation took" in res[i+1]:
                cmts.add("Output of vm-data1 is empty")
            elif "SUCCEEDED" in res[i + 1]:
                grade+=2
            else:
                cmts.add("The output of vm-data1 is too long or incorrect.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test vm-data1", grade, ",".join(cmts))

def matmult(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "matmult" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')

            i = 0
            indices = []

            for result in res:
                if "OS/161 kernel: p testbin/matmult" == result:
                    indices.append(i)
                i+=1

            success_count = 0

            for index in indices:
                if "Operation took" in res[index+1]:
                    cmts.add("The output of matmult is empty.")

                elif "Operation took" in res[index+4]:
                    if (res[index + 1] == "matmult finished." and
                            res[index + 2] == "answer is: 8772192 (should be 8772192)" and
                            res[index + 3] == "Passed."):
                        success_count+=1

            if success_count == 5:
                grade += 8
            elif success_count > 1:
                grade += 4
            elif success_count > 0:
                grade += 2
            else:
                grade += 0
        
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")

    if grade == 0:
        cmts.add("The output of matmult is too long or incorrect.")

    if grade !=8:
        cmts.add("Matmult passed only {0}/5 times".format(success_count))
        
    return ("Test matmult", grade, ",".join(cmts))

def sort(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "sort" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')

            i = 0
            indices = []

            for result in res:
                if "OS/161 kernel: p testbin/sort" == result:
                    indices.append(i)
                i+=1

            success_count = 0

            for index in indices:
                if "Operation took" in res[index+1]:
                    cmts.add("The output of sort is empty.")

                elif "Operation took" in res[index+2]:
                    if (res[index + 1] == "testbin/sort: Passed."):
                        success_count+=1

            if success_count == 6:
                grade += 8
            elif success_count > 1:
                grade += 4
            elif success_count > 0:
                grade += 2
            else:
                grade += 0
        
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")

    if grade == 0:
        cmts.add("The output of sort is too long or incorrect.")

    if grade !=8:
        cmts.add("Sort passed only {0}/6 times".format(success_count))
        
    return ("Test sort", grade, ",".join(cmts))

def vm_data1_many(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "vm-data1-many" in t.name]
    success_count = 0
    for test in mytests:
        try:
            res = test.results().split('\n')

            i = 0
            indices = []

            for result in res:
                if "OS/161 kernel: p uw-testbin/vm-data1" == result:
                    indices.append(i)
                i+=1

            for index in indices:
                if "Operation took" in res[index+1]:
                    cmts.add("The output of vm-data1_many is empty.")

                elif "Operation took" in res[index+2]:
                    if (res[index + 1] == "SUCCEEDED"):
                        success_count+=1

            if success_count == 7:
                grade += 8
            elif success_count > 3:
                grade += 4
            elif success_count > 0:
                grade += 2
            else:
                grade += 0
        
        except Exception as e:
            traceback.print_exc()
            cmts.add("Cannot parse assignment log - likely an error in your assignment")

    if grade == 0:
        cmts.add("The output of vm-data1_many is too long or incorrect.")

    if grade > 0 and grade !=8:
        cmts.add("vm-data1_many passed only {0}/7 times".format(success_count))
        
    return ("Test vm-data1-many", grade, ",".join(cmts))

def sty(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "sty" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p testbin/sty")

            if ("Operation took" in res[i+1] and
                    "OS/161 kernel: q" in res[i + 2] and
                    "Shutting down" in res[i + 3]):
                grade+=9
            else:
                cmts.add("The output of sty is incorrect")
                #cmts.add(str(res))
        except Exception as e:
            traceback.print_exc()
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test sty", grade, ",".join(cmts))

def vm_data3(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "vm-data3" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p uw-testbin/vm-data3")

            if "Operation took" in res[i+1]:
                cmts.add("Output of vm-data3 is empty")

            elif "SUCCEEDED" in res[i+1]:
                grade+=3
            else:
                cmts.add("The output of vm-data3 is incorrect")
        except Exception as e:
            traceback.print_exc()
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test vm-data3", grade, ",".join(cmts))


def add(tests, helpers):
    grade = 0
    cmts = set()
    mytests = [t for t in tests if "add" in t.name]
    for test in mytests:
        try:
            res = test.results().split('\n')
            i = res.index("OS/161 kernel: p testbin/add 897 78")

            if "Operation took" in res[i+1]:
                cmts.add("The output of add is empty.")

            elif "Operation took" in res[i+2]:
                if "Answer: 975" in str(res[i+1]):
                    grade += 4
                else:
                    cmts.add("The output of add is wrong:")
                    cmts.add(res[i+1])
            else:
                cmts.add("The output of add is too long or incorrect.")
        except Exception as e:
            cmts.add("Cannot parse assignment log - likely an error in your assignment")
        
    return ("Test add", grade, ",".join(cmts))

RUBRIC = {
    add: 4,
    argtest_long: 2,
    argtest_many: 2,
    argtest_none: 2,
    argtesttest: 4,
    hogparty: 9,
    hogparty_many: 3,
    matmult: 8,
    romemwrite: 8,
    sort: 8,
    sty: 9,
    vm_crash2: 8,
    vm_data1: 2,
    vm_data1_many: 8,
    vm_data3: 3,
    widefork: 2
}
