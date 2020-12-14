### Check network connectivity problems with traceroute

1. Execute (ideally repeat a few times)
   ```
   traceroute -q 10 -w 1 -S google.com 10240
   ```
   
   Parameters explained:
   * `-q 10` -  10 probes per ttl (default is 3)
   * `-w 1`  -  1s probe timeout (default is 5s)
   * `-S`    -  print summary per ttl
   * `10240` -  use 10kB packets

2. Look for the first ttl line where the packet loss occurs
   - The first line is (usually) your home router
   - The further you go to more widespread the issue is (home router -> ISP -> internet service)

#### Example output

Example output where packet loss occurs at the first ttl (home router):
```
traceroute to google.com (142.250.75.14), 64 hops max, 10240 byte packets
 1  192.168.2.1 (192.168.2.1)  3.893 ms  2.685 ms  2.115 ms  2.034 ms  2.264 ms  2.628 ms *  3.654 ms *  2.737 ms (20% loss)
 2  pppoe1-ca.tengig.kolnet.eu (213.5.248.15)  6.114 ms  6.237 ms  5.744 ms  7.750 ms  6.324 ms  5.747 ms *  8.009 ms  6.651 ms  5.334 ms (10% loss)
 3  bgp-pppoe1.tengig.kolnet.eu (213.5.248.14)  7.745 ms  5.200 ms  6.528 ms  6.611 ms  5.728 ms  6.753 ms *  7.276 ms  5.737 ms  6.959 ms (10% loss)
 4  google.ip4.epix.net.pl (178.216.40.134)  13.171 ms  16.773 ms  14.348 ms  14.103 ms  14.618 ms  13.880 ms  14.024 ms  14.150 ms  16.305 ms  14.693 ms (0% loss)
 5  108.170.250.217 (108.170.250.217)  12.747 ms  12.769 ms  14.030 ms  12.380 ms  12.427 ms  13.334 ms  13.220 ms  19.571 ms  18.842 ms  18.824 ms (0% loss)
 6  142.250.46.55 (142.250.46.55)  14.189 ms  14.285 ms  13.925 ms  14.556 ms  14.074 ms  13.156 ms  13.757 ms  13.981 ms  14.322 ms  14.319 ms (0% loss)
 7  142.250.37.193 (142.250.37.193)  12.737 ms  13.660 ms  12.948 ms  13.104 ms  14.726 ms  13.433 ms  14.402 ms  14.414 ms  14.346 ms  14.360 ms (0% loss)
 8  142.250.238.1 (142.250.238.1)  14.627 ms  13.719 ms  15.659 ms  14.016 ms  14.976 ms  13.131 ms  13.203 ms  14.346 ms  13.657 ms  14.623 ms (0% loss)
 9  waw07s03-in-f14.1e100.net (142.250.75.14)  13.622 ms  13.165 ms  15.481 ms  13.431 ms  13.578 ms  12.561 ms  13.477 ms  14.330 ms  13.397 ms * (10% loss)
```

