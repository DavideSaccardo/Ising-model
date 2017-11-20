#include <cmath>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <cstdlib>
#include <random>
#include <string>
#include <chrono>


using namespace std;
ofstream ofile;

//Function to consider periodic boundary conditions
inline int PeriodicBoundary(int i, int N, int add){
    return (i+N+add)%N;
}

//Declaration of functions
void MCcomputation(long int, int, double, double*, int );
void initializeLattice(int, double**, double &, double &, int);
void writeResultstofile(int, long int, double, double* );

int main(int argc, char* argv[])
{
    //Declaration of Variable
    double initialTemp=2.4; //temperature at which we start our calculations
    double finalTemp=2.5; //temperature at which we end our calculations
    int numberOfSpins=20; // number of spin of the lattice considered, the dimension is thus L=numberOfSpinsXnumberOfSpins
    double stepTemp=0.005; //step of temperatures
    long int numberOfMCcycles=1e6; //number of total Monte Carlo cycles used
    int flag=1; //if flag=1 we start with a random initial configuration of spins in the lattice, if flag=0 we start with all the spins up

    //open ouput file
    string fileout = "output.txt";
    ofile.open(fileout);

//start of the clok to consider the run time
auto start = std::chrono::system_clock::now();

//loop of temperatures to see the evolution of the thermodynamical quantities as functions of temperature
    for (double Temperature=initialTemp; Temperature<finalTemp; Temperature+=stepTemp){
        double* expectation_values=new double[6];
        for( int i =0; i < 6; i++) expectation_values[i] = 0;

        MCcomputation(numberOfMCcycles, numberOfSpins, Temperature, expectation_values, flag);
        //function to write results to file, we start to take data from cycles>5e4 to be in the steady state, hence we have to normalize with numberOfMCcycles-5e4
        writeResultstofile(numberOfSpins,numberOfMCcycles-5e4,Temperature, expectation_values);

        delete[] expectation_values;
    }
   ofile.close();  // close output file

    //End clock
    auto end = std::chrono::system_clock::now();
            std::chrono::duration<double> diff = end-start;
            std::cout << "Time " << diff.count() << " s\n"; //display run time
    return 0;
}


void MCcomputation(long int numberOfMCcycles, int numberOfSpins, double Temperature, double* expectation_value, int flag){

    //Generation of a random number
    std::random_device rd;
    std::mt19937_64 gen(rd());
    std::uniform_real_distribution<double> RandomNumberGenerator(0.0,1.0);

    //Declaration of variables
    double energy=0.0;
    double magnetic_moment=0.0;

    //Prepare the lattice represented as matrix
    double** matrixOfSpins=new double* [numberOfSpins];
    for(int i=0; i<numberOfSpins; i++){
        matrixOfSpins[i]=new double [numberOfSpins];
    }

    //Function to fill our lattice with all spins up if flag=0, or with a random config of spins if flag=1
    initializeLattice(numberOfSpins, matrixOfSpins, energy, magnetic_moment, flag);

    //Computation of the difference of energy, which are just five
    double* differenceOfEnergy=new double[5];
    double beta=1*Temperature;
    for(int i=-2;i<3;i++){
        differenceOfEnergy[i+2]=exp(-4*i/beta);
    }

    //MC loop
    for(long int cycle=1;cycle<=numberOfMCcycles;cycle++){
        for(int i=0; i<=numberOfSpins; i++){
          for(int z=0;z<=numberOfSpins;z++){
              //we pick a random spin in the lattice
                int randIndexSpin1 = (int) (RandomNumberGenerator(gen) * numberOfSpins);
                int randIndexSpin2 = (int) (RandomNumberGenerator(gen) * numberOfSpins);
                double q=0;

                 //and we compute the new energy
                for(int j=-1;j<2;j+=2){
                    q+=matrixOfSpins[randIndexSpin1][PeriodicBoundary(randIndexSpin2,numberOfSpins,j)]+matrixOfSpins[PeriodicBoundary(randIndexSpin1,numberOfSpins,j)][randIndexSpin2];
                }

                int deltaE= 2  * q * matrixOfSpins[randIndexSpin1][randIndexSpin2];

                //Metropolis acceptance rule, the condition deltaE<=0 is redundant with the other, but it's useful to speed up the code as we avoid a generation of random number, which is time expensive
                if(deltaE<=0||RandomNumberGenerator(gen)<=differenceOfEnergy[deltaE/4+2]){
                    expectation_value[5]+=1;
                    matrixOfSpins[randIndexSpin1][randIndexSpin2] *= -1.0; //flip the spin if the condition is satisfied
                    magnetic_moment+=(double) 2 * matrixOfSpins[randIndexSpin1][randIndexSpin2]; //I calculate again the magnetic moment and energy
                    energy+=(double)deltaE;

          }
        }
                 }

        //if we are in the equilibrium state, which we found to be after 5e4 MC cycles, we update the expectation values
    if(cycle>5e4){
        expectation_value[0]+=energy;
        expectation_value[1]+=energy*energy;
        expectation_value[2]+=magnetic_moment;
        expectation_value[3]+=magnetic_moment*magnetic_moment;
        expectation_value[4]+=fabs(magnetic_moment);
    }
    }
    for (int i=0; i<numberOfSpins;i++){
        delete[] matrixOfSpins[i];
    }
    delete[] matrixOfSpins; //free memory
}

void initializeLattice(int numberOfSpins, double** matrixOfSpins, double &energy, double &magnetic_momentum, int Flag){
    //Function to fill our matrix with spins all up (Flag==0) or random spins (Flag==1). It also computes the initial enegy and magnetic momnet

    if (Flag==1){
    std::random_device rd;
    std::mt19937_64 gen(rd());
    std::uniform_real_distribution<double> RandomNumberGenerator(0.0,1.0);

    for(int i=0;i<numberOfSpins;i++){ //fill matrixOfSpins with random spins
        for(int j=0;j<numberOfSpins ;j++){
            double spinrandom=RandomNumberGenerator(gen);
            if(spinrandom>0.5) spinrandom=1;
            if (spinrandom<0.5) spinrandom=-1;

            matrixOfSpins[i][j]=spinrandom;
            magnetic_momentum+=matrixOfSpins[i][j];
        }
    }
    }

    if (Flag==0){
    for(int i=0;i<numberOfSpins;i++){ //fill the matrix with all spins up
        for(int j=0;j<numberOfSpins ;j++){
            matrixOfSpins[i][j]=1.0;
            magnetic_momentum+=matrixOfSpins[i][j];
        }
    }
    }

    //computation of initial energy
    for(int i=0;i<numberOfSpins;i++){
        for(int j=0;j<numberOfSpins;j++){
            energy-=matrixOfSpins[i][j]*(matrixOfSpins[PeriodicBoundary(i,numberOfSpins,-1)][j]+matrixOfSpins[i][PeriodicBoundary(j,numberOfSpins,-1)]); //that spinc an only interact with nearest neighbors
        }
    }
}

void writeResultstofile(int numberOfSpins,long int numberOfMCcycles,double Temperature,double* expectation_values){
    //This function writes the results to a file and it normalizes the expectation values for the dimenion of the lattice
    double norm = 1.0/((double) (numberOfMCcycles));  // divided by  number of cycles
    double E_ExpectationValue = expectation_values[0]*norm; //<E>
    double E2_ExpectationValue = expectation_values[1]*norm; // <E^2>
    double M_ExpectationValue = expectation_values[2]*norm; //<M>
    double M2_ExpectationValue = expectation_values[3]*norm; //<M^2>
    double Mabs_ExpectationValue = expectation_values[4]*norm; //|M|
    // all expectation values are per spin, divide by 1/Number of spins^2
    double Evariance = (E2_ExpectationValue- E_ExpectationValue*E_ExpectationValue)/(numberOfSpins*numberOfSpins);
    double Mvariance = (M2_ExpectationValue - M_ExpectationValue*M_ExpectationValue)/(numberOfSpins*numberOfSpins);
    double Mvariance_abs = (M2_ExpectationValue - Mabs_ExpectationValue*Mabs_ExpectationValue)/(numberOfSpins*numberOfSpins);
    ofile << setiosflags(ios::showpoint | ios::uppercase);
    //ofile << "Temperature:              Energy:             Cv:             Magn:             Chi:               |M|:" << endl;
    ofile << setw(15) << setprecision(8) << Temperature;
    //ofile << setw(15) << setprecision(8) << numberOfMCcycles;
    ofile << setw(15) << setprecision(8) << E_ExpectationValue/(numberOfSpins*numberOfSpins); //Energy
    ofile << setw(15) << setprecision(8) << Evariance/(Temperature*Temperature); //CV
    //ofile << setw(15) << setprecision(8) << M_ExpectationValue/(numberOfSpins*numberOfSpins); //M
    ofile << setw(15) << setprecision(8) << Mvariance/Temperature; //susceptibility
    ofile << setw(15) << setprecision(8) << Mvariance_abs/Temperature; //susceptibility computed with |M|
    ofile << setw(15) << setprecision(8) << Mabs_ExpectationValue/(numberOfSpins*numberOfSpins)<<endl; // |M|
    //ofile << setw(15) << setprecision(8) << expectation_values[5]<< "\n"; //number of accepted choices
}
