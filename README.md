# vault-rds-mysql

This repository contains scripts that will enable the database secrets engine on Vault.

## Run Script

```
$ ./configure.sh [USERNAME] [PASSWORD] [HOST]
```

You can also modify the configurations in the script.

## Generate a new Credential

```
$ vault read database/creds/my-role
```

## Revoke Lease

```
$ vault lease revoke LEASE_ID
```
