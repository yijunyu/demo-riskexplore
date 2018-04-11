[![Build Status](https://travis-ci.org/yijunyu/demo-riskexplore.svg?branch=master)](https://travis-ci.org/yijunyu/demo-riskexplore)
# Demo of Risk Exploration tool
Prerequiste software: 
 * docker (tested on RHEL6 Linux) or docker-machine (tested on Mac OSX)
 * PRISM (as is)
 * YACAS (with my extension of the linalg module)
 * riskexplore (include my implementation of the risk exploration algorithms)

Here are some installation steps for dependencies if you start from Mac OSX

## Prepare the docker machine
docker-machine create --driver virtualbox default

## Update the code from submodules, namely yacas, riskexplore, and prism
git submodule init
git submodule update

## Build prism
cd prism/prism && make && cd ../..

## Switch Yacas to the develop branch
cd yacas && git checkout develop && cd ..

## Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Install GNU awk to replace the native awk on OSX
brew install gawk

## Install R
brew install R

# After all the dependencies are installed, now

## Build

cd risk && ./b && cd ..

## Run

./r examples/PIN

where PIN is a DTMC prism model with the file extension ".pm", e.g., examples/PIN.pm. 

For optimising the utility function on probabilistic variables, the command provides additional constants as the impact of individual states in the rewards section in the PRISM model. 

## Usage scenarios
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

./r examples/Model1 examples/Model2 ...

Suppose Model 1 has N1 states, and Model 2 has N2 states, then the composed Model will have N1 * N2 states. 

However, the number of transitions is not necessarily the product of the number of transitions of these two submodels.

The rule of thumb is to compute the probability of transition (s, t) -> (s', t') as

(M1) x (s->s', t'=t) + (M2) x (s'=s, t -> t')
where (M1) = (M2) = 0.5.

A composed state (s,t)->(s',t') will be created if and only if s=s' or t=t'. 

It has now been extended to compose N parallel machines.

### Risk Exploration

Given an exploration machine, the risk profile function (RPF) is derived from probabilities of transitions and impact of states in the model.
If these probability parameters are allowed to be free-formed, ranging from 0 to 1, then it is possible to approximate the maximum risk with
these ranges using DEoptim method. If the domains of these parameters can be changed by control measures, then the maximum risk will be
recomputed. 

Suppose for each of the $n$ parameters in the RPF $p_i$, there are $n_i$ ways to control the lower and upper bounds $lb_{i,j_i} \leq p_i \leq ub_{i,j_i}$ where
$j_i \in {1, \ldot, n_i)$. A model parameter configuration $\vec{k}=(k_1, \ldots, k_n)$ chooses a specific way $j_i=k_i$ for the $i$-th variable,
Denote the maximal value of the risk profile function as $rpf(\vec{k})$ for any model parameter configuration such that $lb_{i,k_i} \leq p_i \leq ub_{i,k_i}.$ 
As such, the minimal risk is defined as $rpf(\vec{k})$ so that for any other configurations $\vec{j}$, $rpf(\vec{k}) \leq rpf(\vec{j})$.

Using the two-factor authentication example, you can see the exploration as such:

	./r examples/2FA
	rscript examples/2FA.rpf

The results are shown below. According to the risk profile function, maximal risk 0.99 is the result of given probabilities (p, q) and impact values (i1, i2, i3),
when these variables can be chosen from any random values within [0, 1] range.

On the other hand, if a model configuration is chosen to control these ranges, e.g., the 3rd configuration of p, the 2nd configuration of q, and the 3rd configuration
of i1 are chosen, then the maximal risk would become -0.2625, for a new binding of probabilities and impact values. This risk is the smallest amongst all the possible
maximal risks of all such configurations.

When you are exploring the different options in the variability of security controls, such an exploration of risks could be very helpful to plan what to do next. 

```
risk 
====
0.99 

            p             q            i1            i2            i3 
 ============  ============ ============= ============= ============= 
 7.543682e-02  2.122051e-11 -4.293226e-14 -1.000000e-02  1.000000e+00 

minimal_risk 
============
     -0.2625 

    p     q    i1    i2    i3 
===== ===== ===== ===== =====
 0.60  0.20 -0.50 -0.01  1.00 

 p  q i1 i2 i3 
== == == == ==
 2  1  2  0  0 
```
