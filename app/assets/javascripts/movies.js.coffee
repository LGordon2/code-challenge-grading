errors = []

finish = ->
  msg = $("div.results > h4.msg")

  unless typeof(allMovieData) == "undefined"
    errors.push("No movie data could be retrieved, possibly due to an invalid string.") if allMovieData.length == 0
    for movie in allMovieData
      showMovie(movie)

  if passed
    msg.addClass("pass")
    msg.text("Passed")
  else
    msg.addClass("fail")
    msg.text("Failed")
    errors.push("Unknown error") unless errors.length > 0
  $("div.results > div.errors").show() if errors.length > 0
  for error in errors
    $("<li>#{error}</li>").appendTo("div.results > div.errors > ul")

  $("div.results > div.loader").hide()

submissionString = cc_challenge_result

if typeof(submissionString) == "undefined"
  errors.push("There is no submission string...")
  finish()

$("div.results h4.submission-string").text(submissionString)

actorList = submissionString.split(" -> ")

movies = {}

#Get all movie data
for actor in actorList
  parsedActor = /^<(.*?)>\[(.*?)\]$/.exec(actor)
  [_,actorName,actorMovie] = parsedActor unless parsedActor == null
  movies[actorMovie] = actorName

allMovieData = []

passed = true
$.each Object.keys(movies), (index, movieName) ->
  $.getJSON "https://codechallenge.orasi.com/movies",
  {search: movieName},
  (data) ->
    if "error" of data
      errors.push("Movie #{movieName} not found in the database.")
      return passed = passed && scenarioPass
    actorName = movies[movieName]
    nextActor = movies[Object.keys(movies)[index+1]]
    if typeof(nextActor) == "undefined"
      nextActor = "Kevin Bacon"
    scenarioPass = (data.actors.indexOf(actorName) >= 0) #The actor specified is in the movie.
    errors.push("#{actorName} is not in the movie #{movieName}") unless scenarioPass
    nextActorIsInMovie = (data.actors.indexOf(nextActor) >= 0)
    scenarioPass = scenarioPass && nextActorIsInMovie #The next actor is in the movie.
    errors.push("#{nextActor} is not in the movie #{movieName}") unless nextActorIsInMovie
    allMovieData[index] = {name: movieName, poster: data.poster, pass: scenarioPass, actors: [actorName,nextActor]}
    return passed = passed && scenarioPass

showMovie = (movieData) ->
  return if typeof(movieData) == "undefined"
  movieObj = $("<div class='movie'></div>").appendTo("div.results")
  $("<img src class='movie-poster' id='#{movieData.name}'>").appendTo(movieObj)
  for actor in movieData.actors
    $("<span class='actor-name'>#{actor}</span>").appendTo(movieObj);
  $("div.results .movie:last-child > img").attr("src", movieData.poster);
  if not movieData.pass
    movieObj.css("border", "2px solid red")

$(document).ajaxStop ->
  finish()
