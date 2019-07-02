# vault-rds-mysql

This repository contains a script that will enable and configure the database secrets engine on Vault so it can create dynamic RDS credentials.

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
## Questions?

Open an issue.
