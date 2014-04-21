root = exports ? this

root.createCandyCountJSON = ->
  max_candy_count = 1000
  max_guesser_count = 250
  number_of_people_guessing = randomNumberForTest(max_guesser_count)
  names = ["Valentin","Albert","Naum","Evgeniya","Ludmila","Volya","Grigory", "Tatiana", "Harvey", "Stefan", "Warrick", "Briallen", "Moyna", 'Nur',
  "Seung", "Corneille", "Chiamaka", "Colum", "Baldwin", "Gisela", "Avitus", 'Kathe',"Joni","Laura","Miyoko","Debra","Molly","Madeleine","Amada"]
  json_output = {
    "candy_count": randomNumberForTest(max_candy_count),
    "guesser_count": number_of_people_guessing,
    "guessers": {"name": names[Math.floor(Math.random() * names.length)], "guess": randomNumberForTest(max_candy_count)} for x in [1..number_of_people_guessing]
  }
  JSON.stringify(json_output)
  
randomNumberForTest = (max_num) ->
  Math.floor(Math.random() * max_num) + 1
