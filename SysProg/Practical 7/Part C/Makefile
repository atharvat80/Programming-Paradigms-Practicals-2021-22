lower: input1.txt input2.txt input3.txt
	tr [:upper:] [:lower:] < input1.txt > input1.out
	tr [:upper:] [:lower:] < input2.txt > input2.out
	tr [:upper:] [:lower:] < input3.txt > input3.out

concat: input1.out input2.out input3.out
	cat *.out >> input.all

all: lower concat

clean:
	rm *.out *.all