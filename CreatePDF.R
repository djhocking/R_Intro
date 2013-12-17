# Create .md, .html, and .pdf files
library(knitr)
library(markdown)

# Lesson 2: Data Manipulation
knit("Data-Manipulation.Rmd")
markdownToHTML('Data-Manipulation.md', 'Data-Manipulation.html', options=c("use_xhml"))
system("pandoc -s Data-Manipulation.html -o Data-Manipulation.pdf -H margins.sty")

# Lesson 3: Basic Plotting
knit("03_Plotting_Basics.Rmd")
markdownToHTML('03_Plotting_Basics.md', '03_Plotting_Basics.html', options=c("use_xhml"))
system("pandoc -s 03_Plotting_Basics.html -o 03_Plotting_Basics.pdf -H margins.sty")

# Lesson 4: Plotting with ggplot2
knit("04_ggplot2.Rmd")
markdownToHTML('04_ggplot2.md', '04_ggplot2.html', options=c("use_xhml"))
system("pandoc -s 04_ggplot2.html -o 04_ggplot2.pdf -H /Users/Dan/Documents/Teaching/R_Intro/margins.sty")


# Lesson 6: Complex Objects from Functions
knit("06_ComplexObjects.Rmd")
markdownToHTML('06_ComplexObjects.md', '06_ComplexObjects.html', options=c("use_xhml"))
system("pandoc -s 06_ComplexObjects.html -o 06_ComplexObjects.pdf -H /Users/Dan/Documents/Teaching/R_Intro/margins.sty")