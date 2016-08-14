# Demo of Risk Exploration tool developed at The Open University

## Prerequiste: docker (tested on RHEL6 Linux) or docker-machine (tested on Mac OSX)

### Build

./b

### Run

./r examples/PIN

Here PIN is a DTMC prism model with the file extension ".pm", e.g., examples/PIN.pm. 

### Usage scenarios

#### For numeric computatation, the prismmodelchecker should generate suitable input models already, which will be used by riskexplore. 
The impact numbers can be added to the generated state rewards file, e.g., examples/PIN.srew. 

### For symoblic computation, the numeric output from prismmodelchecker (e.g., the transition matrix) needs to be edited to provide symbolic expressions, e.g., see examples/PIN-symbolic.tra. 
