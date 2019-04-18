n_way_list=(5)
n_shot_list=(1)
dropout_list=(0.2 0.3 0.4)
for n_way in "${n_way_list[@]}" #iter over n_ways_list
do
  for n_shot in "${n_shot_list[@]}" # iter over n_shot_list
  do
    for dropout in "${dropout_list[@]}" # iter over n_shot_list
    do
    [ $n_way -eq 20 -a $n_shot -eq 5 ] && continue
    echo "====================================================================================="
    echo "                       Script for $n_way n_way and $n_shot n_shot and $dropout dropout                           "
    echo "-------------------------------------------------------------------------------------"

    command="python3 train_one_shot_learning_matching_network.py --batch_size 32 --experiment_title omniglot_"$n_way"_"$n_shot"_drop_"$dropout"_matching_network --total_epochs 10 --full_context_unroll_k 5 --classes_per_set $n_way --samples_per_class $n_shot --use_full_context_embeddings False --use_mean_per_class_embeddings False --dropout_rate_value $dropout"
    echo $command
    $command
    done
  done

done
