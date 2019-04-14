epochs=10
n_way_list=(5)
n_shot_list=(1)
learning_rate_list=(0.001 0.005 0.0001)
learning_decay_list=(2 3 4 5)
for n_way in "${n_way_list[@]}" #iter over n_ways_list
do
  for n_shot in "${n_shot_list[@]}" # iter over n_shot_list
  do
    for learning_rate in "${learning_rate_list[@]}"
      do
        echo "====================================================================================="
        echo "  Script for $n_way n_way | $n_shot n_shot | learning_rate $learning_rate | learning_decay $learning_decay  "
        echo "-------------------------------------------------------------------------------------"

        command="python3 train_one_shot_learning_matching_network.py --batch_size 32 --learning_decay $learning_decay --experiment_title omniglot_n_way"$n_way"_n_shot_"$n_shot"_learn_"$learning_rate"_matching_network --total_epochs $epochs --full_context_unroll_k 5 --classes_per_set $n_way --samples_per_class $n_shot --learning_rate $learning_rate --use_full_context_embeddings False --use_mean_per_class_embeddings False --dropout_rate_value 0.0"
        echo $command
        $command
    done
  done

done
