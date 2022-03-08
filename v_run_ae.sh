#!/bin/bash
echo nr9: $9

datadir=$1
data=$2
model=$3
train_opts=$4
data_opts=$5
epochs=$3
save_interval=$7
test_id=$8
trainedmodeldir=$6
save_interval_start=$7
random_seed=${11}

echo trainedmodeldir: $trainedmodeldir

superpops=/mnt/ae_data/HO_superpopulations

singularity exec --nv --bind /proj/gcae_berzelius/users/kristiina:/mnt /proj/gcae_berzelius/users/filip/image_latest.sif python -u run_gcae.py train --datadir $datadir --data $data --model_id $model  --epochs 40 --save_interval 2 --train_opts_id $train_opts  --data_opts_id $data_opts --trainedmodeldir $trainedmodeldir 
#--random_state $random_seed

echo --------------------------- traning finished hopefully--------------------------

singularity exec --nv --bind /proj/gcae_berzelius/users/kristiina:/mnt /proj/gcae_berzelius/users/filip/image_latest.sif python -u run_gcae.py project --datadir $datadir --data $data --model_id $model --train_opts_id $train_opts  --data_opts_id $data_opts --trainedmodeldir $trainedmodeldir  
#--random_state $random_seed

echo --------------------------- projecting finished hopefully--------------------------

#singularity exec --nv --bind /proj/gcae_berzelius/users/kristiina:/mnt /proj/gcae_berzelius/users/filip/image_latest.sif python -u run_gcae_l.py evaluate --metrics f1_score_3,f1_score_5,f1_score_8,f1_score_10,f1_score_15,f1_score_20 --datadir $datadir --data $data --model_id $model  --train_opts_id $train_opts  --data_opts_id $data_opts --superpops $superpops --trainedmodeldir $trainedmodeldir 
#--random_state $random_seed

#singularity exec --nv --bind /proj/gcae_berzelius/users/kristiina:/mnt /proj/gcae_berzelius/users/filip/image_latest.sif python -u run_gcae.py plot  --datadir $datadir --data $data --model_id $model  --train_opts_id $train_opts  --data_opts_id $data_opts --superpops $superpops --trainedmodeldir $trainedmodeldir 
#--random_state $random_seed

#singularity exec --nv --bind /proj/gcae_berzelius/users/kristiina:/mnt /proj/gcae_berzelius/users/filip/image_latest.sif python -u run_gcae.py evaluate --metrics f1_score_qda --datadir $datadir --data $data --model_id $model  --train_opts_id $train_opts  --data_opts_id $data_opts --superpops $superpops --trainedmodeldir $trainedmodeldir

