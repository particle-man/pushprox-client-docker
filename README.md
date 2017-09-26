# PushProx-Client-Docker
Container management for proxy client to allow Prometheus to scrape through NAT etc.

Code behind PushProx: https://github.com/RobustPerception/PushProx

This repo is for the "client", not the "proxy".

# Variables
This container relies on an ENV variable:
PROXPUSH_URL which should point to the location of its proxy.
