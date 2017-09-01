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

# Lesson 5: Basic Stats
knit("Basic_Stats.Rmd")
markdownToHTML('Basic_Stats.md', 'Basic_Stats.html', options=c("use_xhml"))
system("pandoc -s Basic_Stats.html -o Basic_Stats.pdf -H /Users/Dan/Documents/Teaching/R_Intro/margins.sty")


# Lesson 6: Complex Objects from Functions
knit("06_ComplexObjects.Rmd")
markdownToHTML('06_ComplexObjects.md', '06_ComplexObjects.html', options=c("use_xhml"))
system("pandoc -s 06_ComplexObjects.html -o 06_ComplexObjects.pdf -H /Users/Dan/Documents/Teaching/R_Intro/margins.sty")

# Lesson 7: Functions, Control Structures, Scoping
setwd('/Users/Dan/Documents/Teaching/R_Intro/07_Software_Carpentry_Intermediate/functions/')
knit("01-functions.Rmd")
markdownToHTML('01-functions.md', '01-functions.html', options=c("use_xhml"))
system("pandoc -s 01-functions.html -o 01-functions.pdf -H /Users/Dan/Documents/Teaching/R_Intro/margins.sty")

knit("02-control_structures.Rmd")
markdownToHTML('02-control_structures.md', '02-control_structures.html', options=c("use_xhml"))
system("pandoc -s 02-control_structures.html -o 02-control_structures.pdf -H /Users/Dan/Documents/Teaching/R_Intro/margins.sty")

knit("03-scoping_rules.Rmd")
markdownToHTML('03-scoping_rules.md', '03-scoping_rules.html', options=c("use_xhml"))
system("pandoc -s 03-scoping_rules.html -o 03-scoping_rules.pdf -H /Users/Dan/Documents/Teaching/R_Intro/margins.sty")

markdownToHTML('function_examples.md', 'function_examples.html', options=c("use_xhml"))
system("pandoc -s function_examples.html -o function_examples.pdf -H /Users/Dan/Documents/Teaching/R_Intro/margins.sty")

markdownToHTML('exercises.md', 'exercises.html', options=c("use_xhml"))
system("pandoc -s exercises.html -o exercises.pdf -H /Users/Dan/Documents/Teaching/R_Intro/margins.sty")







