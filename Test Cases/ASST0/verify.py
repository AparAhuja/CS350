def has_name(tests, helpers):
    # Check one test:
    res = tests[0].results()
    marks = 0.0
    cmts = set()
    if "Put-your-group-name-here" in res:
        cmts.add("Name not changed")
    else:
        if len(res) == 0:
            cmts.add("Empty")
        elif "01234567" in res:
            marks += 2.0

    return ("Added Name", marks, ",".join(cmts))


def kernel_menu(tests, helpers):
    marks = 0.0
    cmts = set()
    dth_tests = [t for t in tests if "dth" in t.name]
    assert len(dth_tests) == 2
    for t in dth_tests:
        if helpers.check_all(
            ["dth: Command not found", "Menu command failed"], t.results()
        ):
            cmts.add("dth command not found or failed")
        else:
            if len(t.results()) == 0:
                cmts.add("Empty")
            else:
                if "Forking thread: threadtest" in t.results():
                    marks += 1.5
                else:
                    cmts.add("Debug message \"Forking thread: threadtest\" is missing, dbflag not set correctly")
    return ("Added Kernel Menu", marks, ",".join(cmts))


RUBRIC = {
    has_name: 2,
    kernel_menu: 3,
}
