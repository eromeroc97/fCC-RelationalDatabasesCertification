#! /bin/bash

if [[ $1 == "test" ]]; then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# No cambies el código arriba de esta línea. Usa la variable PSQL para consultar tu base de datos.
tail -n +2 games.csv | awk -F ',' '{print $3 "\n" $4}' | sort | uniq | while read -r team; do
    echo "$($PSQL "INSERT INTO teams (name) VALUES ('$team');")"
done

while IFS=',' read -r year round winner opponent winner_goals opponent_goals; do
    echo "Processing: year=$year, round=$round, winner=$winner, opponent=$opponent, winner_goals=$winner_goals, opponent_goals=$opponent_goals"
    if [ -n "$winner" ] && [ -n "$opponent" ]; then
        winner_id="$($PSQL "SELECT team_id FROM teams WHERE name = '$winner'")"
        opponent_id="$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent'")"
        echo "$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$year', '$round', '$winner_id', '$opponent_id', '$winner_goals', '$opponent_goals')")"
    else
        echo "Error: Empty values detected for winner or opponent."
    fi
done < games.csv