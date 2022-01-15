#' @export

nuvem <- function()
{

library(NLP)
library(tm)

texto = Corpus(DirSource("C:/Users/allin/Documents/TADS_IFPE/MATEMATICA/TRABALHO R", encoding="UTF-8"),readerControl = list(readPlain, language="por"))

inspect(texto)

stopwords('portuguese')

texto = tm_map(texto, removeWords,stopwords('portuguese'))
texto = tm_map (texto, stripWhitespace)
texto = tm_map(texto, removePunctuation)

texto = tm_map(texto, content_transformer(tolower))

tdm = TermDocumentMatrix(texto)
tdm
m = as.matrix(tdm)
m
v = sort(rowSums(m),decreasing=TRUE)
v
d = data.frame(word = names(v), freq=v)
head(d, 50)

library(RColorBrewer)
library(wordcloud2)
set.seed(1234)
wordcloud(words = d$word, freq = d$freq, min.freq = 10, max.words=200, random.order = T, rot.per=0.5, colors = brewer.pal(8, "Dark2"))
wordcloud2(d)
wordcloud2(d, color = "random-light", backgroundColor = "grey")
}
