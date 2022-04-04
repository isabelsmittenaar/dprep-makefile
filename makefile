all: plot_Antwerp.pdf plot_all.pdf

reviews.csv listings.csv: download.R
	R --vanilla < download.R

aggregated_df.csv: reviews.csv listings.csv clean.R
	R --vanilla < clean.R
	
pivot_table.csv: aggregated_df.csv pivot.R
	R --vanilla < pivot.R
	
plot_Antwerp.pdf: pivot_table.csv plot_antwerp.R
	R --vanilla < plot_antwerp.R
	
plot_all.pdf: plot_all.R aggregated_df.csv
	R --vanilla < plot_all.R 
	