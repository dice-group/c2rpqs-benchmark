# Supplementary material for the paper: "Efficient Evaluation of Conjunctive Regular Path Queries Using Multi-way Joins"

# Experiments (Ansible playbook)
To set up the experiments, we provide an Ansible playbook.

Installation: https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

Ansible 2.15.6 is used for these experiments.

## Before running the playbook
 - Replace ```<ip_of_host>``` in ```ansible_playbook/inventory.yaml``` with the IP of the managed node (i.e., the server that will run the experiments).
 - Replace ```<target_dir>``` in ```ansible_playbook/roles/base/defaults/main.yaml``` with the absolute path to the directory of the managed node that will store the experiments' required files.
 - Replace ```<user>``` in ```ansible_playbook/roles/base/defaults/main.yaml``` with the username that will be used to login with to the managed node.
 - Replace ```<ansible-temp-directory>``` in ```ansible_playbook/ansible.cfg``` with the absolute path to the directory that will be used as a temporary directory for ansible.
 - Donwload the binaries of our implementation from [here](https://files.dice-research.org/projects/tentris-c2rpqs/c2rpqs-binaries.zip) and place the contents of ```c2rpqs-binaries.zip``` in ```ansible_playbook/roles/tentris/files```.
 - Download the free version of GraphDB 10.3.3 and add it to ```ansible_playbook/roles/graphdb/files```.
 - Build [MilleniumDB](https://github.com/MillenniumDB/MillenniumDB) (commit: 42e650), compress the binaries ```create_db_sparql``` and ```server_sparql``` to a zip file called ```milleniumdb.zip``` and add ```milleniumdb.zip``` to the folder ```ansible_playbook/roles/milleniumdb/files```.

## Playbook Execution
You can execute the playbook by issuing the following command within the `ansible_playbook` directory:

    ansible-playbook -kKi inventory.yaml playbook.yaml

## Benchmark Execution
Before running the benchmarks:

- Increase the ulimit
    
        ulimit -n 64000
    
- Prepare the databases
       
        cd <target_dir>
        sudo ./run-loaders.sh

To run the comparison of the different graph storage solutions, execute the script ```run-sparql.sh``` with root privileges.

    cd <target_dir>
    sudo ./run-sparql.sh

To run the comparison of the different execution strategies, execute the script ```run-sparql-tentris.sh``` with root privileges.

    cd <target_dir>
    sudo ./run-sparql-tentris.sh

The results  of the benchmark (IGUANA result files, one per system) are stored in the directory `<target_dir>/iguana_results/sparql`

## Data, Queries and Results
The data comes from [WDBench](https://github.com/MillenniumDB/WDBench)

The set of queries that we used is a subset of [this set of queries](https://github.com/MillenniumDB/WDBench/blob/master/Queries/c2rpqs.txt) (WDBench) and can be found in `artifacts/queries`.

The results reported in the paper can be found in `artifacts/results`.

## Pre-Built Binaries
We provide pre-built binaries of our closed-sourced implementation [here](https://files.dice-research.org/projects/tentris-c2rpqs/c2rpqs-binaries.zip).
They are not to be redistributed or used for any other purpose (commercial or non-commercial) other than reproducing the results reported in the paper.