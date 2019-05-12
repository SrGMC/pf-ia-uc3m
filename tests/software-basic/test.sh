#!/bin/bash
set -e

maxtests=18
algo=('astar' 'greedy' 'breadth_first' 'depth_first')

touch "student/map.txt"
for i in $(seq 1 $maxtests); do
	rm "student/map.txt"
	cp "student/maps/map_test${i}.txt" "student/map.txt"
	
	for j in "${algo[@]}"; do
		echo "Running test $i, algorithm $j"
		new="        algorithm = simpleai.search.${j}"
		sed -i "173s/.*/$new/" "student/gameProblem.py"

		output="tests/test_${i}_${j}.txt"
		python startGame.py > "$output"
		wait $!
	done
done