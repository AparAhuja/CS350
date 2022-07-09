import subprocess
import traceback

TYPE_TEST = "test"
TEST_NUM = 9 

DEBUG=False

MARK_ALLOCATION = {
    "test_cat": 10,
    "test_copyin": 10,
    "test_copyout": 10,
    "test_create": 5,
    "test_debug": 5,
    "test_format": 5,
    "test_mount": 5,
    "test_remove": 5,
    "test_stat": 5,
}

title_str = [
        ">Expected Output<",
]

def mark(tests, helpers, t_type, debug=False):
    try:
        grade = 0
        cmts = set()
        tests = [t for t in tests if t_type in t.name]
        if len(tests) == 0:
            cmts.add(f"Compilation error")
            return (f"{t_type} Tests", grade, ",".join(cmts))

        for t in tests:
            # get the lines from the output
            print(t.name)
            r = t.results().strip().split("\n")
            
            for i, strout in enumerate(r):
                for title in title_str:
                    if title in strout:
                        r[i] = title
                        break

            # compose program output 
            # remove all > and spaces
            idx = r.index(">Expected Output<")
            prog_output = ''.join(r[1:idx])

            exp_output = ''.join(r[idx+1:])
            exp_output = exp_output.replace(" ", "")
            exp_output = exp_output.replace("\n", "")

            output = [i for i in range(len(prog_output)) if prog_output.startswith('[RESULT]', i)]
            prog_output_fmt = ""
            for idx in output:
                if prog_output[idx+8] == 'S':
                    prog_output_fmt += "[RESULT]Success"
                else:
                    prog_output_fmt += "[RESULT]Failure"

            if debug:
                print("=================")
                print(f"[Program output] {prog_output_fmt}")
                print(f"[Expected output] {exp_output}")
             
            if prog_output_fmt != exp_output:
                cmts.add(f"Wrong output {t.name}")
                continue

            grade += MARK_ALLOCATION[t.name]
    except:
        if DEBUG:
            print(traceback.format_exc())

        cmts.add("Cannot parse assignment log - likely an error in your assignment. Ensure that your output is correctly formated.")

    return (f"{t_type} Tests", grade, ",".join(cmts))

def test(tests, helpers):
    return mark(tests, helpers, TYPE_TEST, DEBUG)


RUBRIC = {
    test: 60,
}
