export PYTHONPATH="src"

for tgt_lang in "ARA" "DEU"
do
    cmd="python src/ets/train_dpo_cpo.py \
        --po_algorithm cpo \
        --dataset data/ets/dpo_cpo_train/${tgt_lang} \
        --llama_model meta-llama/Llama-2-7b-hf \
        --sft_model_dir trained_models/ets/sft/transfer/${tgt_lang}/best_checkpoint_merged \
        --save_path trained_models/ets/cpo/transfer/${tgt_lang} \
        --n_epochs 10 \
        --batch_size 16 \
        --gradient_accumulation_steps 4 \
        --beta 0.5 \
        --lr 2e-6"

    echo $cmd 
    eval $cmd
done
