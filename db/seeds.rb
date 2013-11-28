# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create({username: "test.user", first_name: "test", last_name: "user"})
Challenge.create({month: "june", league: "bronze", year: 2013, title: "Hello, World", winner: ""})
Challenge.create({month: "june", league: "silver", year: 2013, title: "String Character Counting", winner: "Cyntia Cali"})
Challenge.create({month: "june", league: "gold", year: 2013, title: "Super Secret Message", winner: "Lewis Gordon"})
Challenge.create({month: "july", league: "bronze", year: 2013, title: "Flip It and Reverse It", winner: ""})
Challenge.create({month: "july", league: "silver", year: 2013, title: "Find All Primes", winner: "Lateef Livers"})
Challenge.create({month: "july", league: "gold", year: 2013, title: "Boggle-ingly Hard ", winner: "Ethan Bell"})
Challenge.create({month: "august", league: "bronze", year: 2013, title: "Array Order", winner: "Joey Wysosky"})
Challenge.create({month: "august", league: "silver", year: 2013, title: "Who Do I Work For Again?", winner: "Matthew Clark"})
Challenge.create({month: "august", league: "gold", year: 2013, title: "N-Queens Problem", winner: "Kevin O'Grady"})
Challenge.create({month: "september", league: "bronze", year: 2013, title: "Palindrome Emord Nilap?", winner: "Andy Dargatz"})
Challenge.create({month: "september", league: "silver", year: 2013, title: "Collatz Conjecturing", winner: "Matthew Clark"})
Challenge.create({month: "september", league: "gold", year: 2013, title: "Tic-Tac-Toe", winner: "Kevin O'Grady"})
Challenge.create({month: "october", league: "bronze", year: 2013, title: "Factorial Fun", winner: "Brian Buckhana"})
Challenge.create({month: "october", league: "silver", year: 2013, title: "Greatest Common Divisor", winner: "Navin Asuri"})
Challenge.create({month: "october", league: "gold", year: 2013, title: "Finding Reducible Primes", winner: "Ethan Bell"})
Challenge.create({month: "november", league: "bronze", year: 2013, title: "Fibonacci Sequence", winner: ""})
Challenge.create({month: "november", league: "silver", year: 2013, title: "Can I Haz Cheezeburger?!?", winner: ""})
Challenge.create({month: "november", league: "gold", year: 2013, title: "Connect Four", winner: ""})