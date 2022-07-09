import sys
import random
import os

#get the first argument as input
inputFileName = sys.argv[1]

#contains the sumtotal
sumTotal = 0

#contains the number of articles and threads to generate
numarticles = [20, 30, 40]
numThreads = [4, 8]

#make the files
#os.system("make > /dev/null")

checks = 0

#get current path
#systemPath = "/".join(inputFileName.split("/")[0:-1])

#open the temp file
file = open("temp.txt", 'w+')

#check if the file being called exists
if not os.path.exists(inputFileName) :
    print("ERROR: the file %s does not exist" % inputFileName)
#END IF

output = []

#for the number of articles and threads to test
for article in numarticles :
    for thread in numThreads :

        #save the seed generated
        seed = str(random.randint(1, 100))

        #set default success message
        buffer = "Test: article (%d), seed (%s), thread (%d) passes" % (article, seed, thread)

        #run the command and capture stderr output
        command = f"timeout 100s {inputFileName} {article} {seed} {thread} 2> temp.txt > /dev/null"
        resultValue = os.system(command)

        #check if the resulting funnction fails
        if resultValue == 124:
            buffer = "Test: article (%d), seed (%s), thread (%d) TIMEDOUT" % (article, seed, thread)
            output.append(buffer)
            continue
        elif resultValue != 0 :
            buffer = "Test: article (%d), seed (%s), thread (%d) fails" % (article, seed, thread)
            output.append(buffer)
            continue
        else :
            checks += 1
        #END IF

        #counts the number of iterations in the check
        iteration = 0

        #for each line of error code
        for line in file :
            #iterate the counter
            iteration += 1
            output.append(line)

            #if we are at the final line of the output
            if iteration == 3 :

                #if the multithreaded segment fails
                if line.strip() == "ERROR: Please fix any bottlenecks in the code." :

                    checks -= 0.5
                    buffer += "Test: article (%d), seed (%s), thread (%d) fails multithreading test" % (article, seed, thread)
                #if the single threaded segment fails
                elif line.strip() == "ERROR: Please check for race conditions or other bugs." :
                    checks -= 1
                    buffer += "Test: article (%d), seed (%s), thread (%d) fails single threaded test" % (article, seed, thread)
                #END IF
            #END IF
        #END FOR

        #append the data to the buffer
        output.append(buffer)

        #close the file
        file.close()

        #destroy the temp file
        os.system("rm temp.txt")

        #open the temp file
        file = open("temp.txt", 'w+')
    #END FOR
#END FOR

#output the final score
output.append("Total Score is as follows: %d/6" % checks)

#output the results table
for element in output :
    print(element)
#END FOR
