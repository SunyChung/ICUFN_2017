import os
import time
import threading
import sys

p_cpu_array = []
p_mem_array = []

def runTop(systemtime, pid):
	string = systemtime.replace(" ", "-")
	cmd = "top -p "+pid+" -n 10 | grep "+pid+" >> top-"+string+".txt"
	#cmd = "top -p "+pid+" -n 1 | grep "+pid
	os.system(cmd)
	f_cpu = open("top-"+string+".txt")
	f = open("kvm-short-traffic-cpu-usage.txt", 'a')
	read = f_cpu.read()
	array = read.split("\n")
	print systemtime
	f.write(str(systemtime)+"\n")
	for i in range(0, len(array)-1 ):
		p_cpu = array[i].split()[8]
		p_mem = array[i].split()[9]
		p_cpu_array.append(p_cpu)
		p_mem_array.append(p_mem)
		f.write(str(p_cpu)+"\t"+str(p_mem)+"\n")
	f.close()
	os.system("rm top-*")
	

if __name__ == "__main__":
	starttime = time.time()
	endtime = time.time()
	while (endtime - starttime < 700):
		localtime = time.asctime( time.localtime(time.time()))
		runTop(localtime,str(28624))
		endtime = time.time()
	sys.exit()
