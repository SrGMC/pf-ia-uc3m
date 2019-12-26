#!/bin/bash
set -e

maxt=11
maxh=11

touch "student/map.txt"
mkdir tests
for i in $(seq 1 "$maxt"); do	
	mkdir "tests/test${i}"
    rm "student/map.txt"
    cp "student/maps/map_test${i}.txt" "student/map.txt"
    for j in $(seq 0 "$maxh"); do
		echo "Running test $i, heuristic $j"
		new="        heuristic = $j"
		sed -i -e "316s/.*/$new/" "student/gameProblem.py"

		output="tests/test${i}/h${j}.txt"
		time python startGame.py > "$output"
		wait $!
	done
done
