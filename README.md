# PHP shopping cart Application with automatic Keyword Harvesting and Similar product recommender
This is a simple shopping cart application made in PHP with automatic keyword harvesting and similar product recommender using cosine similarity machine learning. Codeigniter framework is used for user interfae and application design.

##Keyword harvesting
TF-IDF is used for harvesting top keywords of the document. TF-IDF counts global and document frequency for the given word and calculates a score as

TFIDF of a word in a document, `TFIDF = TF x IDF = TF x log (N/DF)`

where,
 - TF = Term Frequency = frequency of given word in a document
 - IDF = Inverse Documnet Frequency = number of documents that contain given word in document collection
 - IDF is calculated as log of total number of documents (N) divided by Document frequency (DF) i.e.
 - IDF = `log (N/DF)`

##Similarity
Similarity is found by constructing n-dimensional vector of TFIDF scores in each documnet. Then the angle between these vectors are calculated. Smaller the angle between any two documents, larger is the similarity between them. For that, we find cosθ for the vectors. The cosθ for vectors with same angle (0 degree) is 1, and as the angle increases from 0 to 90 degree, the value decreases from 1 to 0. 

Cosθ can be found easily by dividing dot product of vectors by magnitudes of the vectors

If the two document vectors are a and b, their magnitudes are |a| and |b| respectively.

`cosθ = ( a . b ) / ( |a| * |b| )`

