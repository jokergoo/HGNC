

DB = read.table(system.file("extdata", "hgnc_table.txt", package = "HGNC"), 
	sep = "\t", header = TRUE, check.names = FALSE, stringsAsFactors = FALSE)
colnames(DB) = c("Gene Symbol", "Entrez Gene ID", "Ensembl Gene ID", "RefSeq ID")

ALL_ID_TYPES = colnames(DB)

guess_id_type = function(x) {
	if(grepl("^\\d+$", x)) {
		"Entrez Gene ID"
	} else if(grepl("^ENSG", x)) {
		"Ensembl Gene ID"
	} else if(grepl("^\\w\\w_", x)) {
		"RefSeq ID"
	} else {
		"Gene Symbol"
	}
}

#' Convert Gene IDs
#' 
#' It only converts between gene symbol, Entrez IDs, Ensembl IDs 
#' and RefSeq ids for human.
#' 
#' @param id   A vector of gene IDs.
#' @param from The ID type of input gene IDs.
#' @param to   The ID type that user wants to convert to.
#' 
#' @export
#' @examples
#' id_convert("TP53", to = "Ensembl")
id_convert = function(id, 
	from = guess_id_type(id[1]), 
	to = c("Gene Symbol", "Entrez Gene ID", "Ensembl Gene ID", "RefSeq ID")) {
	
	to = match.arg(to)
	map = structure(DB[[to]], names = DB[[from]])
	return(map[id])
}
