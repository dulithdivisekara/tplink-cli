/**
 * TP-Link Router C/C++ Header Interface
 * Author: Dulith Divisekara (SLIIT Malabe)
 */

#ifndef TPLINK_ROUTER_H
#define TPLINK_ROUTER_H

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    char model[64];
    char hardware_version[32];
    char firmware_version[64];
    int is_connected;
} TPLinkDeviceInfo;

typedef struct {
    int rsrp_dbm;
    int rsrq_db;
    int snr_db;
    int signal_bars;
    char band[32];
    char earfcn[16];
    char pci[16];
} TPLinkRFMetrics;

/**
 * Executes a CLI command and returns exit code.
 */
int tplink_cli_exec(const char *subcommand, const char *args);

#ifdef __cplusplus
}
#endif

#endif // TPLINK_ROUTER_H
