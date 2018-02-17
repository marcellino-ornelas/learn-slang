a = [
{
 name: "name of current word",
 definition:"current word def",
 options: ["option1","option2","option3"]
},
{
 name: "hyphy",
 definition:"The word is Oakland slang meaning hyperactive.[1] More specifically it is an adjective that describes the music[1][2] and the urban culture associated with that area.[3] It was created by Oakland-based rapper Keak da Sneak[1][3] when he used the term on an album he recorded in 1992.",
 options: ["flat","switch-hit","furly"]
},
{
 name: "push-ay-hard-line",
 definition:"to pursue your hustle, passion, or muscle in a strong, efficient and/or aggresive manner",
 options: ["roll-on","grossing","gettin-bucky"]
},
{
 name: "lightweight",
 definition:"adverb - Kind of | Somewhat | Sort of",
 options: ["highkey","not really","yokin"]
},
{
 name: "gassed",
 definition:"verb - unjustifiably cocky | ego crazy |",
 options: ["flasked","trapped","clicked-up"]
},
{
 name: "i see you",
 definition:"To acknowledge someone elses hustle",
 options: ["vibe you", "i feel you", "i am intrigued"]
},
{
 name: "ghost-ridin",
 definition:"verb - To place your automobile in Neutral, and dance outside of the car as it slowly rolls down the street. Note: Very dangerous Also very illegal.",
 options: ["side-slidin","dippin","auto-twerkolating"]
},
{
 name: "hyphy",
 definition:"The word is Oakland slang meaning hyperactive.[1] More specifically it is an adjective that describes the music[1][2] and the urban culture associated with that area.[3] It was created by Oakland-based rapper Keak da Sneak[1][3] when he used the term on an album he recorded in 1992.",
 options: ["flat","switch-hit","furly"]
},
{
 name: "scrapin",
 definition:"verb = To be driving a vehicle, particularly with regards to involvement in a SIDESHOW",
 options: ["buggin","swiftin","loc-in"]
},
{
 name: "real talk",
 definition:"used to emphasize a statements validity",
 options: ["litty","dity","talkin smack"]
},
{
 name: "what it do",
 definition:"1. A question that arises when a scraper is noticed, requesting that the driver YOKE it 2. Meaning “Whats up/ what’s new”",
 options: ["fli","option2","option3"]
}]

require "./db"

create_table("words")

a.each do |item|

  string = "['" + item[:options].join("','") + "']"

  connection.exec("INSERT INTO words (name, definition, options) VALUES ('#{item[:name]}','#{item[:definition]}',ARRAY#{string})")

end
