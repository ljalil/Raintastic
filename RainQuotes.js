var rainQuotes =
[
"Rain is grace; rain is the sky descending to the earth; without rain, there would be no life. <i><font color='red'>John Updike</font></i>",
"I ran my fastest marathon in the rain. <i><font color='red'>Bill Rodgers</font></i>",
"Some people walk in the rain, others just get wet. <font color='red'>Roger Miller",
"Let the rain kiss you. Let it beat upon your head with silver liquid drops. Let it sing you a lullaby. <font color='red'>Langston Hughes</font>",
"I've always found the rain very calming. <font color='red'>Venus Williams",
"If you think it's going to rain, it will. <font color='red'>Clint Eastwood</font>",
"Loud roared the dreadful thunder, The rain a deluge showers. <font color='red'>Andrew Cherry</font>",
"It didn't rain today, so I didn't have to work. Why don't you have to sit around and wait until it rains? <font color='red'>Linda Fiorentino</font>",
"Some people walk in the rain, others just get wet. <font color='red'>Roger Miller</font>",
"A rainy day is the perfect time for a walk in the woods. <font color='red'>Rachel Carson</font>"
]

function getQuote()
{
     return rainQuotes[Math.floor(Math.random() * 10 + 1)]
}
