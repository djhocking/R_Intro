# Create .md, .html, and .pdf files
library(knitr)
library(markdown)

knit("Data-Manipulation.Rmd")
markdownToHTML('Data-Manipulation.md', 'Data-Manipulation.html', options=c("use_xhml"))
system("pandoc -s Data-Manipulation.html -o Data-Manipulation.pdf -H margins.sty")