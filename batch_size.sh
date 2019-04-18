epochs=10
n_way_list=(5)
n_shot_list=(1)
batch_size_list=(8 16 32 64)
for n_way in "${n_way_list[@]}" #iter over n_ways_list
do
  for n_shot in "${n_shot_list[@]}" # iter over n_shot_list
  do
    for batch_size in "${batch_size_list[@]}"
      do
        echo "====================================================================================="
        echo "         Script for $n_way n_way | $n_shot n_shot | $batch_size batch size           "
        echo "-------------------------------------------------------------------------------------"

        command="python3 train_one_shot_learning_matching_network.py --batch_size $batch_size --experiment_title omniglot_n_way"$n_way"_n_shot_"$n_shot"_batch_"$batch_size"_matching_network --total_epochs $epochs --full_context_unroll_k 5 --classes_per_set $n_way --samples_per_class $n_shot --use_full_context_embeddings False --use_mean_per_class_embeddings False --dropout_rate_value 0.0"
        echo $command
        $command
    done
  done

done
