# HOWTO

```bash
## display
$ tc qdisc show dev eth0

## loss on/off
$ tc qdisc add dev eth1 root netem loss 10%
$ tc qdisc del dev eth1 root netem loss 10%

## jitter/delay 100ms +/- 10ms
$ tc qdisc add dev eth0 root netem delay 100ms 10ms

## reorder
$ tc qdisc change dev eth0 root netem delay 10ms reorder 25% 50%

## corrupt
$ tc qdisc add dev eth0 root netem corrupt 0.2%

```