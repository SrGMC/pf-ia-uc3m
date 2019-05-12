#!/bin/bash
set -e

maxt=6
maxh=11

touch "student/map.txt"
mkdir "tests-autogenerated"
for i in $(seq 0 "$maxh"); do
	for j in $(seq 3 "$maxt"); do
	    rm "student/map.txt"
	    cp "student/auto-generated/test${j}.txt" "student/map.txt"
		echo "Running test $j, heuristic $i"
		new="        heuristic = $i"
		sed -i -e "316s/.*/$new/" "student/gameProblem.py"

		output="tests-autogenerated/test_h${i}_${j}.txt"
		time python startGame.py > "$output"
		wait $!
	done
done