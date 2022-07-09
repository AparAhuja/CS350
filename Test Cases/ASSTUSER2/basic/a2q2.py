import sys
import random
import os
import subprocess

#get the first argument as input
inputFileName = sys.argv[1]

#contains the sumtotal
sumTotal = 0

#contains the number of articals and threads to generate
numConsumers = [10, 20]
numProducers = [5, 10]
numRatio = [4]

#make the files
#os.system("make > /dev/null")
checks = 0

#get current path
systemPath = "/".join(inputFileName.split("/")[0:-1])

#open the temp file
file = open(systemPath + "/temp.txt", 'w+')

output = []

#check if the file being called exists
if not os.path.exists(inputFileName) :
    print("ERROR: the file %s does not exist" % inputFileName)
#END IF

#for the number of articals and threads to test
for consumer in numConsumers :
    for producer in numProducers :
        for ratio in numRatio :
            #run the command and capture stderr output
            command = f"timeout 20s {inputFileName} {consumer} {producer} {ratio} 2> temp.txt > /dev/null"
            try:
                p = subprocess.run(command, shell=True, check=True)
            except Exception as e:
                buffer = str(e)
                output.append(buffer)
                continue

            resultValue = p.returncode
            #check if the resulting funnction fails
            if resultValue == 124:
                buffer = "Test timeout: consumers (%d), producers (%d), ratio (%d) fails" % (consumer, producer, ratio)
                output.append(buffer)
                continue
            elif resultValue != 0 :
                buffer = "Test: consumers (%d), producers (%d), ratio (%d) fails" % (consumer, producer, ratio)
                output.append(buffer)
                continue
            else :
                checks += 1.5
            #END IF

            #counts the number of iterations in the check
            iteration = 0

            #set default success message
            buffer = "Test: consumers (%d), producers (%d), ratio (%d) passes" % (consumer, producer, ratio)

            #for each line of error code
            for line in file :
                #if the multithreaded segment fails
                if line.strip() == "Failed to acquire resource" :
                    checks -= 1.5
                    buffer = "Test: consumers (%d), producers (%d), ratio (%d) fails resource setup" % (consumer, producer, ratio)
                #if the single threaded segment fails
                elif line.strip() == "Failed to set up threads" :
                    checks -= 0.75
                    buffer = "Test: consumers (%d), producers (%d), ratio (%d) fails threaded setup" % (consumer, producer, ratio)
                #END IF
            #END FOR

            #append the data to the buffer
            output.append(buffer)

            #close the file
            file.close()

            #destroy the temp file
            os.system("rm temp.txt")

            #open the temp file
            file = open(systemPath + "temp.txt", 'w+')
        #END FOR
    #END FOR
#END FOR

#output the final score
output.append("Total Score is as follows: %d/6" % checks)

#output the results table
for element in output :
    print(element)
#END FOR
