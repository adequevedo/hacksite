var quotes = [
  "Q1",
  "Q2",
  "Q3"
]

function newQuote(){
  var randomNumber = Math.floor(Math.random() * (quotes.length));
  document.getElementById('quoteDisplay').innerHTML = quotes[randomNumber];
}
