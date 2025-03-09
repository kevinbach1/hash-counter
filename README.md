# Project Description
CSE 420: Project #3, Due: 3/26/2025, 11:59pm

Members:
- David Vong
- Kevin Bach<br>

## Overview
This project aims to implement multi-threaded and sequential counting tools using hash tale data structures to analyze the number of occurences of integers in text files.
<br>
Key features include:
- Custom hash table implementation with chaining to handle collisions.
- Parallel processing, accessing threads safely with Pthreads.
- Locking mechanism with `K` locks
## Parallel Version
This version utilizes Pthreads for concurrent processing, synchronizing access with mutex locks to avoid data corruption.
<br>
Invoked by: `./par_hash_table <N> <K> <directory_path> <output_file> <value>`
## Sequential Version
This is a single-threaded version to process files one by one without threading.
<br>
Invoked by: `./seq_hash_table <N> <directory_path> <output_file> <value>`
