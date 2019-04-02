km9cc: km9cc.c

test: km9cc
	./km9cc -test
	./test.sh

clean:
	rm -f km9cc *.o *~ tmp*
