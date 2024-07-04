# ASTRAPOP
Fork of the official repository for the paper "[Authorship Style Transfer with Policy Optimization](https://arxiv.org/abs/2403.08043)".
This fork is customized to support the Yerevan 2024 Summer School.

# Log in

Log in to your node tunneling port 8080 so you can monitor using WandB:
```
ssh -L 8080:localhost:8080 -t <machine>
```

# Installation

Commends for enviroment setup with conda.
```bash
conda create --name astrapop python=3.8
conda activate astrapop
pip install -U pip
pip install -r requirements.txt
pip install torch==2.3.0 torchvision==0.18.0 torchaudio==2.3.0 --index-url https://download.pytorch.org/whl/cu118
```

# Data

Please see instructors for a link to the data. Create a directory called `data` and unpack the provided tarballs in there.

# Model Permissions

Get access to Llama2 (or a similar model you want to be your backbone) by filling out the form at https://huggingface.co/meta-llama/Llama-2-7b-hf.

Obtain an access token 

```export HUGGINGFACE_ACCESS_TOKEN=<your token>```

# Monitoring

Install wandb and set up a local server; follow instructions through step 2 here: https://docs.wandb.ai/guides/hosting/self-managed/basic-setup



# Reproduce Results

It is recommended to reproduce the ETS results. Only two languages of the original eleven are used, to save time. The scripts that run the original eleven are in `scripts/ets/orig`.

## ETS
To reproduce the results on the ETS dataset, please run the scirpts in `scripts/ets`.
1. Train the style reward model, the paraphrase model, and the reference SFT model by running `00_train_cls.sh`, `00_train_paraphraser.sh`, and `00_train_sft.sh`.
2. Generate the data for DPO and CPO training by running `01_generate_dpo_cpo_data.sh`.
3. Train the PO models using PPO/DPO/CPO by running `02_train_ppo.sh`/`02_train_dpo.sh`/`02_train_cpo.sh`.
4. Transfer the texts in the test set by running `03_generate.sh`.


Here is the information for Reddit, for those interested.

## Reddit
To reproduce the results on the Reddit dataset, please run the scirpts in `scripts/reddit` following the procedure below.
1. Train the paraphrase model and the reference SFT model by running `00_train_paraphraser.sh` and `00_train_sft.sh`.
2. Generate the data for DPO and CPO training by running `01_generate_dpo_cpo_data.sh`.
3. Train the PO models using PPO/DPO/CPO by running `02_train_ppo.sh`/`02_train_dpo.sh`/`02_train_cpo.sh`.
4. Transfer the texts in the test set by running `03_generate.sh`.   
