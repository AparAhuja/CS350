import subprocess
import traceback

TYPE_BASIC = "basic"
BASIC_GRADE_PER = 1.0
BASIC_NUM = 9

TYPE_STDERR = "stderr"
STDERR_GRADE_PER = 1.0
STDERR_NUM = 2

TYPE_BATCH = "batch"
BATCH_GRADE_PER = 1.0
BATCH_NUM = 2

DEBUG=False

title_str = [
        ">Expected Output<",
        ">Start Time<",
        ">Stop Time<",
        ">Target Time Min<",
        ">Target Time Max<"
]

def mark(tests, helpers, t_type, grade_per, debug=False):
    try:
        grade = 0
        cmts = set()
        tests = [t for t in tests if t_type in t.name]
        if len(tests) == 0:
            cmts.add(f"Compilation error")
            return (f"{t_type} Tests", grade, ",".join(cmts))

        for t in tests:
            # get the lines from the output
            r = t.results().strip().split("\n")
            
            for i, strout in enumerate(r):
                if t_type == TYPE_BATCH:
                    if ("command not found" in strout) and ("bash: line" in strout):
                        r[i] = "An error has occurred"
                
                for title in title_str:
                    if title in strout:
                        r[i] = title
                        break

            # compose program output 
            # remove all > and spaces
            idx = r.index(">Expected Output<")
            prog_output = ''.join(r[1:idx])
            prog_output = prog_output.replace(" ", "")
            prog_output = prog_output.replace(">", "")
            prog_output = prog_output.replace("\"", "")
            prog_output = prog_output.replace("\'", "")

            idx2 = r.index(">Start Time<")
            exp_output = ''.join(r[idx+1:idx2])
            exp_output = exp_output.replace(" ", "")
            exp_output = exp_output.replace(">", "")
            exp_output = exp_output.replace("\"", "")
            exp_output = exp_output.replace("\'", "")

            start_time = int(r[idx2+1])

            idx2 = r.index(">Stop Time<")
            stop_time = int(r[idx2+1])

            idx2 = r.index(">Target Time Min<")
            target_time_min = int(r[idx2+1])

            idx2 = r.index(">Target Time Max<")
            target_time_max = int(r[idx2+1])
    
            if debug:
                print("=================")
                print(f"[Program output] {prog_output}")
                print(f"[Expected output] {exp_output}")
                print(f"[Start time] {start_time}")
                print(f"[Stop time] {stop_time}")
                print(f"[Target time min] {target_time_min}")
                print(f"[Target time max] {target_time_max}")

            time_used = stop_time - start_time
            if time_used > target_time_max or time_used < target_time_min:
                cmts.add(f"Time limit exceed {t.name}(check wait impl)")
                continue 

            if prog_output != exp_output:
                cmts.add(f"Wrong output {t.name}")
                continue

            grade += grade_per 
    except:
        if DEBUG:
            print(traceback.format_exc())
        cmts.add("Cannot parse assignment log - likely an error in your assignment. Ensure that your shell is correctly formated.")

    return (f"{t_type} Tests", grade, ",".join(cmts))

def basic(tests, helpers):
    return mark(tests, helpers, TYPE_BASIC, BASIC_GRADE_PER, DEBUG)

def stderr(tests, helpers):
    return mark(tests, helpers, TYPE_STDERR, STDERR_GRADE_PER, DEBUG)

def batch(tests, helpers):
    return mark(tests, helpers, TYPE_BATCH, BATCH_GRADE_PER, DEBUG)


RUBRIC = {
    basic: BASIC_GRADE_PER * BASIC_NUM,
    stderr: STDERR_GRADE_PER * STDERR_NUM,
    batch: BATCH_GRADE_PER * BATCH_NUM
}
