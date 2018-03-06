# nlp-pt-tagger

An NLTK POS tagger for Portuguese, based on [this][ref].

Also serves as a demonstration for baking NLTK corpuses into Docker containers and using them for simple NLP model testing.

## Usage

```bash
# generate tagger.pickle
make train 
# assuming test.txt and tagger.pickle exist:
make test
```

[ref]: https://github.com/fmaruki/Nltk-Tagger-Portuguese