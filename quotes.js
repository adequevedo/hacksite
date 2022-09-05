var quotes = [
  "Q1 this is what a whole sentance will look like spacing wise. Maybe there will even be more -Alex",
  "Q2 this is what a whole sentance will look like spacing wise. Maybe there will even be more -Alex",
  "Q3 Q1 this is what a whole sentance will look like spacing wise. Maybe there will even be more -Alex"
]

function newQuote(){
  var randomNumber = Math.floor(Math.random() * (quotes.length));
  document.getElementById('quoteDisplay').innerHTML = quotes[randomNumber];
}
