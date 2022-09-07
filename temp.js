// var s1 = "random ```code block ``` stuff "
// var s2 = "``fdfdjk``"
// const regex = /```(.*?)```/
//
//
// var s3 = s1.match(regex)
// console.log(s3[0])
//
// s4 = s3[0].replace("```", "")
// console.log(s4)
//
// s5 = s4.replace("```", "")
// console.log(s5)


const quotes = {
	"key1": {
		"quote": "this is an example quote",
		"author": "me",
		"tags": ["funny", "iasip"]
	},
	"key2": {
		"quote": "this is an example quote 2",
		"author": "me",
		"tags": ["inspo"]
	}
}

const fs = require('fs');

let rawdata = fs.readFileSync('quotes.json');
let data = JSON.parse(rawdata);
console.log(data);

data["key3"] = {
                "quote": "this is an example quote 3",
                "author": "me",
                "tags": ["hard"]
               }


console.log(data);
data = JSON.stringify(data);
fs.writeFileSync("quotes2.json", data);

// var keys = Object.keys(quotes);
// var output = quotes[keys[ keys.length * Math.random() << 0]];
// console.log(output["quote"])





// for (var point in data){
  // console.log(data[point]["quote"])
// }

// console.log(data[1])
