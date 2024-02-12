#! /bin/bash

if [[ $1 == "test" ]]; then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# No cambies el código arriba de esta línea. Usa la variable PSQL para consultar tu base de datos.
tail -n +2 games.csv | awk -F ',' '{print $3 "\n" $4}' | sort | uniq | while read -r team; do
    echo "$(psql -c "INSERT INTO teams (name) VALUES ('$team');")"
done

while IFS=',' read -r year round winner opponent winner_goals opponent_goals; do
    winner_id=$(psql -Atc "SELECT id FROM teams WHERE name = '$winner'")
    opponent_id=$(psql -Atc "SELECT id FROM teams WHERE name = '$opponent'")
    echo "$(psql -c "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ('$year', '$round', '$winner_id', '$opponent_id', '$winner_goals', '$opponent_goals');")"
done
