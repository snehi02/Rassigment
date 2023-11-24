#Q1)
library(pdftools)
text <- pdf_text("C:/Users/Admin/Downloads/Walmart-10K-Reports-Optimized.pdf")

#Q2)
library(pdftools)
pdf_path <- "C:/Users/Admin/Downloads/Walmart-10K-Reports-Optimized.pdf"
text <- pdf_text(pdf_path)


text_page_56 <- text[56]
cat(text_page_56)

#Q3)
lines <- strsplit(text_page_56, "\n")[[1]]
                                    
lines <- lines[lines != ""]
start <- grep("Revenues:", lines)
end <- length(lines)
table_lines <- lines[(start + 1):end]
table_lines <- lines[(start + 1):end]
income_data <- strsplit(table_lines, "\\s+")
income_df <- data.frame(matrix(unlist(income_data), nrow = length(income_data), byrow = TRUE))
colnames(income_df) <- income_df[1, ]
income_df <- income_df[-1, ]
income_df <- apply(income_df, 2, function(x) as.numeric(gsub("[^0-9.-]", "", x)))
print(income_df)
