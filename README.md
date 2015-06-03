# PHP shopping cart Application with automatic Keyword Harvesting and Similar product recommender
This is a simple shopping cart application made in PHP with automatic keyword harvesting and similar product recommender using cosine similarity machine learning. Some Natural Language Processing (NLP) methods are used in this application. Codeigniter framework is used for user interfae and application design.

##Keyword harvesting
TF-IDF is used for harvesting top keywords of the document. The basic concept of TF-IDF is that, 

 - if the word is more frequent, it gives good information about the text i.e. the more frequent word is likely to be the keyword
 - if the word is more frequent over all document, it carries less information about what the whole documnet represents. i.e. It is less likely to make keyword.

 With this method, very common words in english like "the", "and" etc. carry very less information about the document, while the word like "optics" which is less common, carry more information about the document.


TF-IDF counts global and document frequency for the given word and calculates a score. The score calculating formula may however be different in different implementations with normalizations and weights on components. Here, we use straight forward and most popular formula

TFIDF of a word in a document, `TFIDF = TF x IDF = TF x log (N/DF)`

where,
 - TF = Term Frequency = frequency of given word in a document
 - IDF = Inverse Documnet Frequency = number of documents that contain given word in document collection
 - IDF is calculated as log of total number of documents (N) divided by Document frequency (DF)
 - IDF = `log (N/DF)`

Term frequency can be calculated easily, for Inverse Document frequency, we need large documnet set to learn from. 

##Similarity
Similarity is found by constructing n-dimensional vector of TFIDF scores in each documnet. Then the angle between these vectors are calculated. Smaller the angle between any two documents, larger is the similarity between them. For that, we find cosθ for the vectors. The cosθ for vectors with same angle (0 degree) is 1, and as the angle increases from 0 to 90 degree, the value decreases from 1 to 0. 

Cosθ can be found easily by dividing dot product of vectors by magnitudes of the vectors

If the two document vectors are `a` and `b`, their magnitudes are `|a|` and `|b|` respectively.

`cosθ = ( a . b ) / ( |a| * |b| )`

Similarity between any two items can be found with this method. In our case, the vectors are constructed with TFIDF score. But the vector can be made with any type of score representing the item to be considered.

