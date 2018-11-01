var i=0;	
var result = [];
var count=0;
var timeout;
var downloadTimer;
var arr = [];
var iteration=0;
var questions = {
		a1: { question:"The day before the day before yesterday is three days after Saturday. What day is it today?", options:[ "Monday", "Tuesday", "Thrusday", "Friday" ] },
		a2: { question:"Which one of the four is least like the other three?", options:[ "Dog", "Mouse", "Lion", "Snake" ] },
		a3: { question:"What is usually associated with color red?", options:[ "Apple", "Banana", "Coffee", "Cola" ] },
		a4: { question:"Library is to book as book is to", options:[ "Binding", "Copy", "Page", "Cover" ] },
		a5: { question:"10 is to 6 as 3 is to:?", options:[ "-2", "1", "4", "-1" ] },
		a6: { question:"Mary's parents have three daughters: April, May, and who is the third?", options:[ "July", "June", "March", "Mary" ] },
		a7: { question:"You are in a footrace. You pass the person in 2nd place. What place are you in now?", options:[ "1st", "2nd", "3rd", "4th" ] },
		a8: { question:"How many continents are there on Earth?", options:[ "7", "Over 100", "20", "38" ] },
		a9: { question:"What number best completes the analogy: 10:5 as 8:?", options:[ "-2", "1", "4", "-1" ] },
		a10: { question:"The acronym IQ stands for....?", options:[ "Internet Quality", "Internet Quantitve", "Intelligence Quotient", "Internet Quotient" ] },
		a11: { question:"Question 11", options:[ "A", "B", "C", "D" ] },
		a12: { question:"Question 12", options:[ "A", "B", "C", "D" ] },
		a13: { question:"Question 13", options:[ "A", "B", "C", "D" ] },
		a14: { question:"Question 14", options:[ "A", "B", "C", "D" ] },
		a15: { question:"Question 15", options:[ "A", "B", "C", "D" ] },
		a16: { question:"Question 16", options:[ "A", "B", "C", "D" ] },
		a17: { question:"Question 17", options:[ "A", "B", "C", "D" ] },
		a18: { question:"Question 18", options:[ "A", "B", "C", "D" ] },
		a19: { question:"Question 19", options:[ "A", "B", "C", "D" ] },
		a20: { question:"Question 20", options:[ "A", "B", "C", "D" ] }
	};
	
function myQuestion(){
	i = randomquestion();
	++iteration;
	if(iteration>=11){
		finalResult();
	}
	else{
		var text = "";
		text = "Question "+iteration+ ": "+questions["a" + i].question + "<br>";
		text += '<form name="choices" onsubmit="return calc(i);" method="post">'
			for (var j = 0; j<=3; j++){
				text += "<input type='radio' name='answer' value='" + questions["a" + i].options[j] + "'>"+ questions["a" + i].options[j] +" <br>";
		}
		text += '<input type="submit" value="Submit" onclick="timer();" name="Submit">'; 
		text += "</form>";
		text += "<br>";    
		return document.getElementById("questions").innerHTML = text;
	}
}

function randomquestion() {
	
	number = Math.ceil(Math.random()*20);
        
	if(arr.indexOf(number)==-1){
		arr[i] = number;
		return arr[i];
	}
	else{
		i--;
		return randomquestion();
	}
}

function calc(i){
	result[i] = document.forms["choices"]["answer"].value;
	var answers = ["null","Friday","Snake","Apple","Page","-1","Mary","2nd","7","4","Intelligence Quotient","A","C","D","D","D","D","A","D","B","C"];
	if (answers[i]==result[i]){
		count++; 	
	}
	myQuestion();
}

function timer(){
	countdown();
	clearTimeout(timeout);
    timeout = setTimeout(function(){ 
		if(i<=Object.keys(questions).length){
			myQuestion();
			if(i!=Object.keys(questions).length)
				alert("Time's Up!!!\nWe are forwarding you to next question.");
			else
				alert("Time's up!");
			timer();
		}
		}, 30000);	
}

function countdown(){
	clearInterval(downloadTimer);
	var timeleft = 30;
	if(i<=Object.keys(questions).length){
	downloadTimer = setInterval(function(){
		document.getElementById("questionNumber").innerHTML = timeleft-- + ' seconds remaining';
		if(timeleft <= 0){
		clearInterval(downloadTimer);
		}
	},1000);
	}
}

function hide(){
	document.getElementById('questionOptions').style.visibility="hidden";
}

function finalResult(){
	document.getElementById("questionNumber").innerHTML = "Result";
	document.getElementById("questions").innerHTML = "Your Total score is: " +count+ "/10";
	document.getElementById("demo").innerHTML = "Want to start again? <a href='index.html'>Click here.";
	clearInterval(downloadTimer);
	clearTimeout(timeout);
}
