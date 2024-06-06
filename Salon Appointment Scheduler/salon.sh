#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ SALON APPOINTMENT SCHEDULER ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
    then
      echo -e "\n$1"
  fi

  echo "What woud you like?" 
  # get ALL Services
  ALL_SERVICES=$($PSQL "SELECT service_id, name FROM services order by service_id")
  echo "$ALL_SERVICES" | while read SERVICE_ID BAR NAME 
  do
    echo "$SERVICE_ID) $NAME"
  done
  read MAIN_MENU_SELECTION
}
SCHEDULE_APPOINTMENT () {


}



MAIN_MENU

