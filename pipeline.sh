C:/Users/Qianjx/anaconda3/Scripts/activate base

cd asr/speechbrain
python pretrain.py where.flac

cd ../../nlp/BERT-SQuAD
python api.py

cd ../../
# rm temp/*.wav
out=$(cat temp/answer.txt)

cd tts/FastSpeech2
rm ./output/result/LJSpeech/*
python synthesize.py --text "$out" --restore_step 900000 --mode single -p config/LJSpeech/preprocess.yaml -m config/LJSpeech/model.yaml -t config/LJSpeech/train.yaml
mv ./output/result/LJSpeech/*.wav ../../temp/