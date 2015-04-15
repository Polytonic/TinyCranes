# Prints the Current Date and Time per Git Log Format
moment = require("moment")
datetime = moment(Date.now()).format("YYYY-MM-DD HH:mm:ss ZZ")
console.log datetime
