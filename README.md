# Project4_ISING

In these folders it can be found the codes to study the Ising model for a lattice of dimension numberOfSpinsXnumberOfSpins. In particular:
-Example_data: it contains file txt as example of possibles outcomes: in fact these are the data used to create the images shown in the report. For example output100_1e6_005_final_15 contains the mean energy, mean absolute magnetization, susceptibility, susceptibility computed with |M|, specific heat for L=100X100, MC=1e6, stepTemp=0.005, T\in[2.1,2.5]. 			I could have included other data, but they were too heavy for github.
-Matlab: it contains the script (script.m) used to plot the images found in the paper and all the scripts to import data (all the other files .m); 
-Codes: it contains:
	* main.cpp: it's the code to study the Ising model without parallelization. At the beginning you have to decide:
		-initialTemp: initial temperature at which start the calculations;
		-finalTemp: final temperature at which we end our calculations;
		-stepTemp: step size in the temperatures' loop;
		-numberOfSpins: number of spin of the lattice considered, the dimension is thus L=numberOfSpinsXnumberOfSpins;
		-numberOfMCcycles: number of Monte Carlo cycles;
		-flag: if flag=1 the function initializeLattice will fill the lattice with random spins, if flag=0 it'll fill the lattice 			with all the spins up;
		-cutoff: define a cutoff to start to compute the expectation value after some MC cycles, you can choose it to start the 			computation after you have reached the steady state (5e4 for me).
		To compile: c++ -o run.x main.cpp.
	* parallel_main.cpp: it's the code to study the Ising model with parallelization. It's structured in the same way as the code 			before, the only difference is that you can run it with how many processor you want. Hence, the parameters to declare at the beginning are the same as main.cpp.

		I used it in the university laboratory, hence to compile I'll show what it has to be done there. In the other case it's 		the same, but you have to know where it's located the mpic++ and mpirun.

		To compile: /usr/lib64/openmpi/bin/mpic++ -std=c++11 -o3 parallel_main.cpp -o prova
		To run: /usr/lib64/openmpi/bin/mpirun -np 8 prova