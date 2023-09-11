import json # 파이썬 표준모듈
import tensorflow as tf
from keras.preprocessing.text import Tokenizer
from keras.utils import pad_sequences

with open('data/sarcasm.json', 'r') as f:
    datas = json.load(f)

#print(datas) # headline, is_sarcast, link

sentences = []
labels = []
links = []

for data in datas:
    sentences.append(data['headline'])
    labels.append(data['is_sarcastic'])
    links.append(data['article_link'])

# texts 문장에 총단어수
# print(texts)
myToken = Tokenizer(oov_token='<OOV>')
myToken.fit_on_texts(sentences)
words = myToken.word_index
print('총단어수: ',len(words))

# 시퀀스 만들기
seqs = myToken.texts_to_sequences(sentences)
seqs_pad = pad_sequences(seqs, padding='post')
print(seqs_pad[0:5])
print(seqs_pad.shape)