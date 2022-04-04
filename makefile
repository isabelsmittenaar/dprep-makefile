all: output/plot_Antwerp.pdf output/plot_all.pdf

data/reviews.csv data/listings.csv: src/download.R
	R --vanilla < src/download.R

temp/aggregated_df.csv: data/reviews.csv data/listings.csv src/clean.R
	R --vanilla < src/clean.R
	
temp/pivot_table.csv: temp/aggregated_df.csv src/pivot.R
	R --vanilla < src/pivot.R
	
output/plot_Antwerp.pdf: temp/pivot_table.csv src/plot_antwerp.R
	R --vanilla < src/plot_antwerp.R
	
output/plot_all.pdf: src/plot_all.R temp/aggregated_df.csv
	R --vanilla < src/plot_all.R 
	