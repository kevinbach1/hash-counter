#!/bin/bash

rm *.txt
make clean
make

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'
start1=$(date +%s%N)
./seq_hash_table 10 "$DIR/files/files1" sout_seq_10_files1_2_unsorted.txt 2
end1=$(date +%s%N)
sort -g sout_seq_10_files1_2_unsorted.txt > sout_seq_10_files1_2.txt

echo -e ""

if diff -w sout_seq_10_files1_2.txt files/correct_files1_2.txt; then
    echo Test 1 Sequential - Success--------------------seq_10_files1_2------------------------------Success
else
    echo Test 1 Sequential - Fail-----------------------seq_10_files1_2------------------------------Fail
fi
echo -e "Execution time of Sequential (Seq_10_files1_2): $(($(($end1-$start1))/1000000)) ms"

sudo sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'
start2=$(date +%s%N)
./par_hash_table 10 2 "$DIR/files/files1" sout_par_10_2_files1_2_unsorted.txt 2
end2=$(date +%s%N)
sort -g sout_par_10_2_files1_2_unsorted.txt > sout_par_10_2_files1_2.txt

if diff -w sout_par_10_2_files1_2.txt files/correct_files1_2.txt; then
    echo Test 1 Parallel - Success--------------------par_10_2_files1_2------------------------------Success
else
    echo Test 1 Parallel - Fail-----------------------par_10_2_files1_2------------------------------Fail
fi
echo -e "Execution time of Parallel (Par_10_2_files1_2): $(($(($end2-$start2))/1000000)) ms"

speedup=$(echo "scale=2; $(($end1-$start1)) / $(($end2-$start2))" | bc)
echo -e "Test 1 Speed-up (Sequential/Parallel): $speedup times.\n"





sudo sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'
start1=$(date +%s%N)
./seq_hash_table 100000 "$DIR/files/files2" sout_seq_100000_files2_2_unsorted.txt 2
end1=$(date +%s%N)
sort -g sout_seq_100000_files2_2_unsorted.txt > sout_seq_100000_files2_2.txt

if diff -w sout_seq_100000_files2_2.txt files/correct_files2_2.txt; then
    echo Test 2 Sequential - Success--------------------seq_100000_files2_2--------------------------Success
else
    echo Test 2 Sequential - Fail-----------------------seq_100000_files2_2--------------------------Fail
fi
echo -e "Execution time of Sequential (Seq_100000_files2_2): $(($(($end1-$start1))/1000000)) ms"

sudo sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'
start2=$(date +%s%N)
./par_hash_table 100000 1 "$DIR/files/files2" sout_par_100000_1_files2_2_unsorted.txt 2
end2=$(date +%s%N)
sort -g sout_par_100000_1_files2_2_unsorted.txt > sout_par_100000_1_files2_2.txt

if diff -w sout_par_100000_1_files2_2.txt files/correct_files2_2.txt; then
    echo Test 2 Parallel 1 - Success--------------------par_100000_1_files2_2------------------------Success
else
    echo Test 2 Parallel 1 - Fail-----------------------par_100000_1_files2_2------------------------Fail
fi
echo -e "Execution time of Parallel 1 (Par_100000_1_files2_2): $(($(($end2-$start2))/1000000)) ms"

sudo sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'
start3=$(date +%s%N)
./par_hash_table 100000 100 "$DIR/files/files2" sout_par_100000_100_files2_2_unsorted.txt 2
end3=$(date +%s%N)
sort -g sout_par_100000_100_files2_2_unsorted.txt > sout_par_100000_100_files2_2.txt

if diff -w sout_par_100000_100_files2_2.txt files/correct_files2_2.txt; then
    echo Test 2 Parallel 2 - Success--------------------par_100000_100_files2_2----------------------Success
else
    echo Test 2 Parallel 2 - Fail-----------------------par_100000_100_files2_2----------------------Fail
fi
echo -e "Execution time of Parallel 2 (Par_100000_100_files2_2): $(($(($end3-$start3))/1000000)) ms"

speedup1=$(echo "scale=2; $(($end1-$start1)) / $(($end2-$start2))" | bc)
speedup2=$(echo "scale=2; $(($end1-$start1)) / $(($end3-$start3))" | bc)
echo -e "Test 2 Speed-up 1 (Sequential/Parallel1): $speedup1 times."
echo -e "Test 2 Speed-up 2 (Sequential/Parallel2): $speedup2 times.\n"





sudo sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'
start1=$(date +%s%N)
./seq_hash_table 200000 "$DIR/files/files4" sout_seq_200000_files4_3_unsorted.txt 3
end1=$(date +%s%N)
sort -g sout_seq_200000_files4_3_unsorted.txt > sout_seq_200000_files4_3.txt

if diff -w sout_seq_200000_files4_3.txt files/correct_files4_3.txt; then
    echo Test 3 Sequential - Success--------------------seq_200000_files4_3---------------------------Success
else
    echo Test 3 Sequential - Fail-----------------------seq_200000_files4_3---------------------------Fail
fi
echo -e "Execution time of Sequential (Seq_200000_files4_3): $(($(($end1-$start1))/1000000)) ms"

sudo sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'
start2=$(date +%s%N)
./par_hash_table 200000 200 "$DIR/files/files4" sout_par_200000_200_files4_3_unsorted.txt 3
end2=$(date +%s%N)
sort -g sout_par_200000_200_files4_3_unsorted.txt > sout_par_200000_200_files4_3.txt

if diff -w sout_par_200000_200_files4_3.txt files/correct_files4_3.txt; then
    echo Test 3 Parallel - Success--------------------par_200000_200_files4_3-------------------------Success
else
    echo Test 3 Parallel - Fail-----------------------par_200000_200_files4_3-------------------------Fail
fi
echo -e "Execution time of Parallel (Par_200000_200_files4_3): $(($(($end2-$start2))/1000000)) ms"

speedup=$(echo "scale=2; $(($end1-$start1)) / $(($end2-$start2))" | bc)
echo -e "Test 3 Speed-up (Sequential/Parallel): $speedup times.\n"





sudo sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'
start1=$(date +%s%N)
./seq_hash_table 400000 "$DIR/files/files8" sout_seq_400000_files8_3_unsorted.txt 3
end1=$(date +%s%N)
sort -g sout_seq_400000_files8_3_unsorted.txt > sout_seq_400000_files8_3.txt

if diff -w sout_seq_400000_files8_3.txt files/correct_files8_3.txt; then
    echo Test 4 Sequential - Success--------------------seq_400000_files8_3---------------------------Success
else
    echo Test 4 Sequential - Fail-----------------------seq_400000_files8_3---------------------------Fail
fi
echo -e "Execution time of Sequential (Seq_400000_files8_3): $(($(($end1-$start1))/1000000)) ms"

sudo sh -c 'sync && echo 3 > /proc/sys/vm/drop_caches'
start2=$(date +%s%N)
./par_hash_table 400000 400 "$DIR/files/files8" sout_par_400000_400_files8_3_unsorted.txt 3
end2=$(date +%s%N)
sort -g sout_par_400000_400_files8_3_unsorted.txt > sout_par_400000_400_files8_3.txt

if diff -w sout_par_400000_400_files8_3.txt files/correct_files8_3.txt; then
    echo Test 4 Parallel - Success--------------------par_400000_400_files8_3-------------------------Success
else
    echo Test 4 Parallel - Fail-----------------------par_400000_400_files8_3-------------------------Fail
fi
echo -e "Execution time of Parallel (Par_400000_400_files8_3): $(($(($end2-$start2))/1000000)) ms"

speedup=$(echo "scale=2; $(($end1-$start1)) / $(($end2-$start2))" | bc)
echo -e "Test 4 Speed-up (Sequential/Parallel): $speedup times."
