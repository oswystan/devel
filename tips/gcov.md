# workflow of gcov

- Write a sample .c or cpp file
- use `gcc -fprofile-arcs -ftest-coverage xxx.c`
- Run the program: `./a.out`
- Run `gcov xxx.c`

```bash
$ gcov -n cov.c
File 'cov.c'
Lines executed:100.00% of 7
Creating 'cov.c.gcov'
```

- You can use `gcovr` to create a xml report

```bash
$ gcovr -r . --xml-pretty -o report.xml
```

