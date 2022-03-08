#!/bin/bash

basedir=/home/x_lotry/GenoCAE

datadir=$basedir/example_tiny/


############################################  W1 ###############################################################################

# namn på körningen, resultaten sparas i en mapp med detta namn
m=vanlig

data=HumanOrigins249_tiny

trainedmodeldir=$basedir/saved_models/${m}/
echo trainmodeldir_launch: $trainedmodeldir

save_interval_start=1
data_opts=b_0_4

declare -a models=(M1)
declare -a train_optss=(ex3)

##################################################################################################################################################






######################################################################## train ##########################################################################################

for model in ${models[@]}
do
for train_opts in ${train_optss[@]}
do
	ls models/$model.json
	ls train_opts/$train_opts.json
	taskname=train.$m.$model.$train_opts.$data_opts.$data
	echo Launching $taskname

	sbatch --gpus=1 -t 20:00:00 -e ${taskname}.error -o ${taskname}.output -J $taskname v_run_ae.sh $datadir $data $model $train_opts $data_opts $epochs $save_interval $test_id $trainedmodeldir $save_interval_start $random_seed
done
done







