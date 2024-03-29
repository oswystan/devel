## INIT

```
mkdir -p /home/svn/data/ && cd /home/svn/data/
svnadmin create .
```

## CONF

- conf/authz

```
[groups]
harry_and_sally = harry,sally
harry_sally_and_joe = harry,sally,&joe
 
[/]
* = rw
harry = rw
@harry_and_sally = rw
```

- conf/passwd

```
[users]
userA = passwd
```

- conf/svnserve.conf

```
[general]
anon-access = none
password-db = passwd
authz-db = authz
```
