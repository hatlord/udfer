# udfer

./udfer /path/to/your/mysql/udf.so

My use case was the old Raptor UDF exploit, so:

~~~
gcc -g -c raptor_udf2.c -fPIC
gcc -g -shared -Wl,-soname,raptor_udf2.so -o raptor_udf2.so raptor_udf2.o -lc
./udfer /path/to/raptor_udf2.so
~~~


