import subprocess

BASIC_GRADE_PER = 2.0
BASIC_NUM = 3

REDIR_GRADE_PER = 2.5
REDIR_NUM = 4

PIPES_GRADE_PER = 2.0
PIPES_NUM = 3

def basic(tests, helpers):
    try:
        grade = 0
        cmts = set()
        tests = [t for t in tests if "basic" in t.name]
        for t in tests:
            # get the lines from the output
            # the prompt is "$ " so we remove occurances of this string from the left
            l = t.results().strip()
            r = [x.split("$ ")[-1] for x in l.split("\n")]

            # first line should be "Program output", and some line should be "Expected Output"
            ind = r.index(">Expected Output<")
            if r[1:ind] == r[ind+1:]:
                grade += BASIC_GRADE_PER
            else:
                cmts.add(f"Wrong output {t.name}")

    except:
        cmts.add("Cannot parse assignment log - likely an error in your assignment. Ensure that your shell is correctly formated, and that the prompt is $ .")

    return ("Basic Tests", grade, ",".join(cmts))

def redir(tests, helpers):
    try:
        grade = 0
        cmts = set()
        tests = [t for t in tests if "redir" in t.name]
        for t in tests:
            # get the lines from the output
            # the prompt is "$ " so we remove occurances of this string from the left
            l = t.results()
            r = [x.split("$ ")[-1] for x in l.split("\n")]

            # first line should be "Program output", and some line should be "Expected Output"
            ind = r.index(">Expected Output<")
            if r[1:ind] == r[ind+1:]:
                grade += REDIR_GRADE_PER
            else:
                if "output" in t.name:
                    cmts.add(f"Wrong output on test {t.name}")
                if "error" in t.name:
                    cmts.add(f"Wrong output on test {t.name}")
                if "input" in t.name:
                    cmts.add(f"Wrong output on test {t.name}")

    except:
        cmts.add("Cannot parse assignment log - likely an error in your assignment. Ensure that your shell is correctly formated, and that the prompt is $ .")

    return ("Redirection Tests", grade, ",".join(cmts))

def pipes(tests, helpers):
    try:
        grade = 0
        cmts = set()
        tests = [t for t in tests if "pipe" in t.name]
        for t in tests:
            # get the lines from the output
            # the prompt is "$ " so we remove occurances of this string from the left
            l = t.results()
            r = [x.split("$ ")[-1] for x in l.split("\n")]

            # first line should be "Program output", and some line should be "Expected Output"
            ind = r.index(">Expected Output<")
            if r[1:ind] == r[ind+1:]:
                grade += PIPES_GRADE_PER
            else:
                cmts.add("Wrong output - likely an error in handling pipes")

    except:
        cmts.add("Cannot parse assignment log - likely an error in your assignment. Ensure that your shell is correctly formated, and that the prompt is $ .")

    return ("Pipe Tests", grade, ",".join(cmts))

RUBRIC = {
    basic: BASIC_GRADE_PER * BASIC_NUM,
    redir: REDIR_GRADE_PER * REDIR_NUM,
    pipes: PIPES_GRADE_PER * PIPES_NUM
}
