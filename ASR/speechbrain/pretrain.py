import sys
from speechbrain.pretrained import EncoderDecoderASR

if __name__ == '__main__':
    asr_model = EncoderDecoderASR.from_hparams(source="speechbrain/asr-crdnn-rnnlm-librispeech", savedir="./pretrained_ASR")
    recording_text = (asr_model.transcribe_file("../../temp/" + sys.argv[1]))
    with open("../../temp/question.txt", 'w') as f:
        print('question:  ' + str.lower(recording_text))
        f.write(str.lower(recording_text))