# OSI 7-layers Models

## Physical Layer
* the reception and transmition of raw unstructured bits data
* **Shared mideum** but it doesn't know the destination
* Example: radio frequency, WIFI

## Data Link Layer
* Use **MAC** address to identify the devices
* Use **frame** as a transfer unit from source MAC address to destination MAC address
* Control the traffic (who can talk and who should wait)in layer 2

## Network Layer
* traveling within different Layer 2 networks

## Transport Layer
* TCP IP(TCP and IP)
* TCP for reliable transfer: TCP use segment to provide **orders** and **correction**(error checking)
* TCP introduce **PORT** to allow different streams in the same host
* UDP for speed

## Session Layer
* Introduce the session to let request and response communication streams are viewed as a single 'session' between server and client
* Distinguish different clients from the same ip and ports
* Security groups utilize layer 5(session layer) to trace and open the reverse rule(inbound to outbound)

## Presentation Layer
* Conversion, Encryption

## Application Layer
* HTTP, FTP and SSH
* HTTP running over layer6 is HTTPs protocol