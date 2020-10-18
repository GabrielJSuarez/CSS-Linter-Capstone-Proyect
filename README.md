![](https://img.shields.io/badge/Microverse-blueviolet)

# CSS-Linter-Capstone-Proyect

> Building a linter tool for css files, that checks the basic sintax of a css file and points all the mistakes that the file has. The CSS Linter checks the following rules:

 - Checks for any trailling white space at the end of a line
 - Checks if a block declaration line has more than one element
 - Checks if there's a space before the block declaration opening ( { )
 - Checks if property lines with CSS rules has a soft indentation of two spaces
 - Checks if the end of the block declaration is in a single line ( } )
 - Checks if there's a space after the colon ( : ) on a property line
 - Checks if properties are in a single line
 - Checks if the propertie line ends with a semi-colon ( ; )
 - Checks if the comma separated values in a propertie line has a space between then
 - Checks if float values that start with 0 (0.5rem) doesn't include the 0
 - Checks if there's an empty line after a block declaration ends
 - Check if there's an empty line at the end of the file

> Test suite:

- Test cases for each method built with Rspec

## Built With

- Ruby, tested with Rspec, formatted with Rubocop for local envoirment and for the github check in the pull request.

![screenshot 1](https://github.com/GabrielJSuarez/CSS-Linter-Capstone-Proyect/blob/tdd_feature_branch/screenshots/screenshot_1.png)

![screenshot 2](https://github.com/GabrielJSuarez/CSS-Linter-Capstone-Proyect/blob/tdd_feature_branch/screenshots/screenshot_2.png)

![screenshot 3](https://github.com/GabrielJSuarez/CSS-Linter-Capstone-Proyect/blob/tdd_feature_branch/screenshots/screenshot_3.png)

## Repl

[Live Demo for main and tests](https://repl.it/@GinnLaiho/CSS-Linter-Capstone-Proyect#README.md)

## Video Presentation

[Video presentation of the project](https://www.loom.com/share/f6143af56fe243a29fa70c6b3268d7fc)


## Getting Started

- Clone the repository

- For Windows Users:
    - In the folder that contains the cloned repository, hold down SHIFT, and right-click.
    - In the context menu click in the option Open command window here (this will open the CDM Window)
    - In the CMD Window run: bin/main (file path)   ## Where the file path is the path of the CSS file that will be checked
    - To run the files in this project you can type ## bin/main assets/css/style_test_2.css
    - If any error is found it will show as an output in the console along with the line number of the ocurrance 
    - Fix any error showing and run the Linter script again to check if everything is complying

- For Linux Users (Ubuntu):
    - In the folder that contains the cloned repository, right-click.
    - In the context menu click in the option Open in Terminal (this will open the Terminal)
    - In the Terminal run: bin/main (file path)   ## Where the file path is the path of the CSS file that will be checked
    - To run the files in this project you can type ## bin/main assets/css/style_test_2.css
    - Fix any error showing and run the Linter script again to check if everything is complying

- To run the Rspec test suit just type in the console 'rspec' and the test suit will run (You need to have the rspec gem installed, you can use the gemfile to install all dependencies)

## Authors

👤 **Gabriel Suárez**

- Github: [@ginnandjuice](https://github.com/ginnandjuice)
- Twitter: [@fatbaxxter](https://twitter.com/fatbaxxter)
- Linkedin: [Gabriel Suárez](https://www.linkedin.com/in/gabriel-su%C3%A1rez-torres-85125a1ab/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/GabrielJSuarez/Enumerable-methods/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- This was built following the guidelines from Microverse:
https://www.notion.so/microverse/Build-your-own-linter-b17a3c22f7b940c98ca1980250720769

- Rainbow gem was used for the formating output in the console

## 📝 License

This project is [MIT](lic.url) licensed.
