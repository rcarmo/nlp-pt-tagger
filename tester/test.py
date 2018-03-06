import os.path
import pickle
import nltk

INPUT_FILE = '/input/test.txt'
TAGGER_PICKLE = '/input/tagger.pickle'

if os.path.exists(INPUT_FILE) and os.path.exists(TAGGER_PICKLE):
    tagger = pickle.load(open(TAGGER_PICKLE,'rb'))
    portuguese_sentence_tokenizer = nltk.data.load("tokenizers/punkt/portuguese.pickle")
    buffer = open(INPUT_FILE).read()

    replacements = {'“': '"', '”':'"', '‘':"'", '’':"'", '`':"'", "''":"'"}
    for k, v in replacements.items():
        buffer = buffer.replace(k,v)

    print(buffer)
    sentences = portuguese_sentence_tokenizer.tokenize(buffer)

    print(sentences)
    tags = [tagger.tag(nltk.word_tokenize(sentence)) for sentence in sentences]
    print(tags)

