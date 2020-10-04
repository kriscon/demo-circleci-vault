pid_file = "./pidfile"
exit_after_auth=true

auto_auth {
    method "approle" {
        config = {
            role_id_file_path = "vault/role-id"
            secret_id_file_path = "vault/secret-id"
        }
        
    }
}

sink "file" {
    config = {
        path = "/tmp/vault-token"
    }
}

template {
    # exports username and password from vault to runtime env variables.
    contents = <<EOF
        {{ with secret /secret_engine/path/secret" }}
        export USER_NAME={{ .Data.usr }}
        export USER_PWD={{ .Data.pwd }}
        {{ END }}
    EOF
    # export creds to a file, can be shared in circleci workspace, should only be used with dynamic secrets.
    destination = "/tmp/credfile"
}