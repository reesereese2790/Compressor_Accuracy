The research paper about the project is provided under Personal_Project__Music_Genre_Classification.pdf.

To run this code you will need to download the GTZAN data set and rename the wav file folder RAW_MUSIC_DATA. 
To transform the GTZAN data, run compression_function.m in Matlab with your desired compression settings. 
Then with your transformed song data, run MFCC_processing.ipynb in Python to do the preprocessing step.
To obtain accuracy values run SVM_START.ipynb in Python on the compressed song csv files obtained from the preprocessing step. 
You will have to train the model on the uncompressed song data csv.

