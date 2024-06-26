#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

getUserData() {
  USERNAME_=$1
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME_'")
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME_'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME_'")
}
# THis is a code !
insertUser() {
  USERNAME=$1
  INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
}
updateUserData() {
  USER_ID=$1
  GAMES_PLAYED=$2
  # comment 
  BEST_GAME=$3
  
  if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
    BEST_GAME=$NUMBER_OF_GUESSES
  fi
  
  if [[ -z $BEST_GAME ]]; then
    UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=NULL WHERE user_id=$USER_ID")
  else
    UPDATE_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE user_id=$USER_ID")
  fi
}
echo "Enter your username:"
read USERNAME
# dfasdfsdf
getUserData $USERNAME

if [[ -z $USER_ID ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  insertUser $USERNAME
  getUserData $USERNAME
else
  if [[ -z $BEST_GAME ]]; then
    BEST_GAME=""
  fi
  
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS
  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    break
  fi
done

GAMES_PLAYED=$((GAMES_PLAYED + 1))

if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]; then
  BEST_GAME=$NUMBER_OF_GUESSES
fi
# HELLO 
updateUserData $USER_ID $GAMES_PLAYED $BEST_GAME
