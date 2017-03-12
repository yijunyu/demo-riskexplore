[![Build Status](https://travis-ci.org/yijunyu/demo-riskexplore.svg?branch=master)](https://travis-ci.org/yijunyu/demo-riskexplore)
# Demo of Risk Exploration tool
Prerequiste: 
 * docker (tested on RHEL6 Linux) or 
 * docker-machine (tested on Mac OSX)

Here are some installation steps for dependencies if you start from Mac OSX

## Prepare the docker machine
docker-machine create --driver virtualbox default

## Update the code from submodules, namely yacas, riskexplore, and prism
git submodule update

## Build prism
cd prism/prism && make

## Switch Yacas to the develop branch
cd yacas && git checkout develop

## Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Install GNU awk to replace the native awk on OSX
brew install gawk

## Install R
brew tap homebrew/science

brew install R

# After all the dependencies are installed, now

## Build

./b

## Run

./r examples/PIN 0 1

where PIN is a DTMC prism model with the file extension ".pm", e.g., examples/PIN.pm. For optimising the utility function on probabilistic variables, providing that the additional constants are the impact of individual states in the rewards section in the PRISM model. 

## Scenarios
### Numeric computatation 
* The outputs from the prism model checker are already suitable input for riskexplore. 
* The impact numbers can be customised to the generated state rewards file, e.g., examples/PIN.srew. 

### Symbolic computation
* The constant probability numbers on the transition matrix, e.g., examples/PIN.tra, can be changed to symbolic expressions. 
E.g., see examples/PIN-symbolic.tra. 
* The constant impact numbers on the state rewards, e.g., examples/PIN.srew, can be changed to symbolic expressions. 
* Note that the expression used should be enclosed by parentheses, such as (r+w+s). 
* The symbolic expression of the risk profile function will be saved as e.g., examples/PIN.risks, and the determinant for the divergence computation will be saved as e.g., examples/PIN.det. 

### Optimisation to minimise the risks
* When the probability variables can take any value between 0 and 1, which combination produces the lowest risk given the constant impact factors? 
* Well, we can use DEoptim between the lower bounds and higher bounds, excluding the values violating the unity constraints of outgoing transitions and the determinant constraints of convergence. As a result, the best combination will be found fairly quickly. 
* The R script will be generated as, e.g., examples/PIN.rpf

### Parallel Composition of DTMC machines
* When two DTMC machines are composed, we follow the convention of PRISM to combine their behaviour models. When the probability are variables insteand of constant, however, the exact value of probability distribution after the composition must be recomputed. 
* The randomness of choice of submachines requires us to merge the transitions of two DTMC modules. This results in a new behaviour model which can still be used to explore the risks.
* To do so, you just need to run 

./r examples/Model1.pm examples/Model2.pm

If Model1 has N1 states, and Model2 has N2 states, then the composed Model will have N1 * N2 states. However, the number of transitions are not necessarily the product of the number of transitions of these two submodels.

The rule of thumb to compute the probability of transition (s, t) -> (s', t') as

(M1) x (s->s', t'=t) + (M2) x (s'=s, t -> t')

where (M1) = (M2) = 0.5.
