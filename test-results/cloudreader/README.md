# ReadiumTestResultsv4.0
ASP.Net application for parsing student intern Readium QA test data, form excel spreadsheets and displaying on screen in a gridview control.
Users can download Readium test results via .xls or .xlsx spreadsheet based on the test results template found here: 
https://github.com/readium/readium.github.io/blob/master/test-results/cloudreader/spreadsheets/user-OS-version-browser-date.xlsx

Backend logic will:
1. get spreadsheets from github folder
2. parse the data from each spreadsheet in the folder and display a summary of test results as well as a link 
to the actual test results spreadsheet in the gridview.
