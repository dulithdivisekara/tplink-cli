/**
 * Native C Entrypoint Wrapper for tplink-cli
 * Author: Dulith Divisekara (SLIIT Malabe)
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "tplink_router.h"

int tplink_cli_exec(const char *subcommand, const char *args) {
    char cmd[1024];
    snprintf(cmd, sizeof(cmd), "python3 -m tplink_cli.cli.main %s %s",
             subcommand ? subcommand : "", args ? args : "");
    return system(cmd);
}

int main(int argc, char *argv[]) {
    char combined_args[2048] = "";
    for (int i = 1; i < argc; i++) {
        strncat(combined_args, argv[i], sizeof(combined_args) - strlen(combined_args) - 1);
        strncat(combined_args, " ", sizeof(combined_args) - strlen(combined_args) - 1);
    }
    return tplink_cli_exec("", combined_args);
}
