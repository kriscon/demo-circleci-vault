# circleci-vault-demo
This is a demonstration project, showing how to inject Hashicorp Vault secrets in a CircleCI pipeline.
The build will connect to Vault, grab a dummy username and password, then output into the build console.

- .circleci/config.yml
    - The CircleCI config file, with a single job and workflow, will output an example username and password from a defined vault path.
- vault/agent.hcl
    - The Vault agent configuration and template file.


## CircleCI project varibles

The CircleCI project needs to be set up with the following environment variables.

|Variable|Descr|
|---|---|
|VAULT_ADDR|Address to the Vault endpoint|
|VAULT_ROLE_ID|Vault approle role id|
|VAULT_SECRET_ID|Vault approle secret|
