[![Build Status](https://travis-ci.org/yijunyu/demo-riskexplore.svg?branch=master)](https://travis-ci.org/yijunyu/demo-riskexplore)
# Demo of Risk Exploration tool
Prerequiste: 
 * docker (tested on RHEL6 Linux) or 
 * docker-machine (tested on Mac OSX)

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
