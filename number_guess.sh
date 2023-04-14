#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USER
if [ ${#USER} -gt 22 ];
  then echo "error: usernames must be within 22 characters."; exit
fi
USERCHECK=$($PSQL "SELECT * FROM users WHERE username = '$USER'")
if [[ ! -z $USERCHECK ]]
then
  # username exists within db
  IFS="|" read NAME GAMES TOP_SCORE <<< "$USERCHECK"
  echo "Welcome back, $USER! You have played $GAMES games, and your best game took $TOP_SCORE guesses."
else
  echo "Welcome, $USER! It looks like this is your first time here."
  NEWUSER=$($PSQL "INSERT INTO users(username, games_played) VALUES ('$USER', 0)")
  GAMES=0
  TOP_SCORE=0
fi
RANDOM_NUM=$(( 1 + $RANDOM % 1000 ))
COUNT=0
echo "Guess the secret number between 1 and 1000:"
read GUESS
while [ GUESS != RANDOM_NUM ]
do
  # validate guess for integer
  if ! [[ "$GUESS" =~ ^[0-9]+$ ]];
  then
    echo -e "That is not an integer, guess again:"
    read GUESS
  elif [ $(($GUESS)) -gt $(($RANDOM_NUM)) ]
    then
      COUNT=$(($COUNT + 1))
      echo -e "It's lower than that, guess again:"
      read GUESS
  elif [ $(($GUESS)) -lt $(($RANDOM_NUM)) ]
    then
      COUNT=$(($COUNT + 1))
      echo -e "It's higher than that, guess again:"
      read GUESS
  else
    # GAME OVER
    COUNT=$(($COUNT + 1))
    GAMES=$(($GAMES + 1))
    echo -e "You guessed it in $COUNT tries. The secret number was $RANDOM_NUM. Nice job!"
    if [[ $TOP_SCORE = 0 || $TOP_SCORE -gt $COUNT ]]
    then
      NEWTOPSCORE=$($PSQL "UPDATE users SET best_game = $COUNT WHERE username = '$USER'")
    fi
    NEWGAMES=$($PSQL "UPDATE users SET games_played = $GAMES WHERE username = '$USER'")
    break
  fi
done
