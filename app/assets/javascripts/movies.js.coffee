submissionString = "<Leonardo DiCaprio>[Gangs of New York] -> <Daniel Day-Lewis>[Lincoln] -> <Sally Field>[Forrest Gump] -> <Tom Hanks>[Apollo 13]"
$("div.results h4.submission-string").text(submissionString)
actorList = submissionString.split(" -> ")
movies = {}

#Get all movie data
for actor in actorList
  [_,actorName,actorMovie] = /^<(.*?)>\[(.*?)\]$/.exec(actor)
  movies[actorMovie] = actorName

allMovieData = []

passed = true
$.each Object.keys(movies), (index, movieName) ->
  $.getJSON "https://codechallenge.orasi.com/movies?callback=?",
  {search: movieName},
  (data) ->
    actorName = movies[movieName]
    nextActor = movies[Object.keys(movies)[index+1]]
    console.log("#{movieName} #{index}")
    if typeof(nextActor) == "undefined"
      nextActor = "Kevin Bacon"
    scenarioPass = (data.actors.indexOf(actorName) >= 0) && #The actor specified is in the movie.
    (data.actors.indexOf(nextActor) >= 0)  #The next actor is in the movie.
    allMovieData[index] = {name: movieName, poster: data.poster, pass: scenarioPass, actors: [actorName,nextActor]}
    return passed = passed && scenarioPass

showMovie = (movieData) ->
  movieObj = $("<div class='movie'></div>").appendTo("div.results")
  $("<img src class='movie-poster' id='#{movieData.name}'>").appendTo(movieObj)
  for actor in movieData.actors
    $("<span class='actor-name'>#{actor}</span>").appendTo(movieObj);
  $("div.results .movie:last-child > img").attr("src", movieData.poster);
  if not movieData.pass
    movieObj.css("border", "2px solid red")

$(document).ajaxStop ->
  msg = $("div.results > h4.msg")
  if passed
    msg.addClass("pass")
    msg.text("Passed")
  else
    msg.addClass("fail")
    msg.text("Failed")

  for movie in allMovieData
    showMovie(movie)

  $("div.results > div.loader").hide();
