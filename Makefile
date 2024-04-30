all: run

clean:
	rm -f out/QuickSort.jar

out/QuickSort.jar: out/parcs.jar src/QuickSort.java
	@mkdir -p temp
	@javac -cp out/parcs.jar -d temp src/QuickSort.java
	@jar cf out/QuickSort.jar -C temp .
	@rm -rf temp/

build: out/QuickSort.jar

run: out/QuickSort.jar
    @cd out && java -cp 'parcs.jar:QuickSort.jar' QuickSort $(WORKERS) > ../sorted_output.txt

