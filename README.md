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

### Symoblic computation
* The constant probability numbers on the transition matrix, e.g., examples/PIN.tra, can be changed to symbolic expressions. 
E.g., see examples/PIN-symbolic.tra. 
* The constant impact numbers on the state rewards, e.g., examples/PIN.srew, can be changed to symbolic expressions. 
* Note that the expression used should be enclosed by parentheses, such as (r+w+s). 
