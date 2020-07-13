main: main.s
	gcc -c -o main.o main.s
	ld -e main -o main.bin main.o

clean:
	rm -f main.o main.bin

.PHONY: clean
