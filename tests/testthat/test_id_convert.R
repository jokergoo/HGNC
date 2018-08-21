context("Test `HGNC`")

test_that("Test `guess_id_type()`", {

    expect_that(guess_id_type("ENSG00000121410"), equals("Ensembl Gene ID"))

    expect_that(guess_id_type("NR_015380"), equals("RefSeq ID"))

    expect_that(guess_id_type("123123"), equals("Entrez Gene ID"))

    expect_that(guess_id_type("TP53"), equals("Gene Symbol"))
})

test_that("Test `id_convert()`", {
    expect_that(id_convert("TP53", to = "Ensembl")[[1]], equals("ENSG00000141510"))
    
    expect_that(id_convert("ENSG00000141510", to = "Gene Symbol")[[1]], equals("TP53"))

    expect_that(id_convert("TsfsfP53", to = "Ensembl")[[1]], equals(NA_character_))
})
