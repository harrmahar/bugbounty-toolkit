# This is Modified Version
This is modified version of Bug Bounty Toolkit from @Rootbakar https://github.com/rootbakar/bugbounty-toolkit. Add some features:
- Tool selection menu (User can choose only the tools he needs)
- Change dirsearch instalation using `apt install dirsearch`

# BugBountyToolkit

A curated collection of essential tools for bug bounty hunters and cybersecurity professionals, designed to streamline your vulnerability assessments and penetration testing efforts.

## 📦 Included Tools

- **Subfinder**: Subdomain discovery tool that returns valid subdomains for websites, using passive online sources. It has a simple, modular architecture and is optimized for speed. .
- **Assetfinder**: Find domains and subdomains potentially related to a given domain.
- **Shosubgo**: Small tool to Grab subdomains using Shodan api.
- **Github-subdomain**: This Go tool performs searches on GitHub and parses the results to find subdomains of a given domain.
- **Chaos**: Utilized as a library for subdomain enumeration by instantiating the Options struct and populating it with the same options that would be specified via CLI.
- **Ffuf**: A fast web fuzzer written in Go.
- **Gobuster**: Gobuster is a tool used to brute-force: URIs (directories and files) in web sites, DNS subdomains (with wildcard support), Virtual Host names on target web servers, Open Amazon S3 buckets, Open Google Cloud buckets, and TFTP servers.
- **Naabu**: Port scanning tool written in Go that allows you to enumerate valid ports for hosts in a fast and reliable manner.
- **Gau**: Fetches known URLs from AlienVault's Open Threat Exchange, the Wayback Machine, Common Crawl, and URLScan for any given domain. Inspired by Tomnomnom's waybackurls.
- **Waybackurls**: Accept line-delimited domains on stdin, fetch known URLs from the Wayback Machine for *.domain and output them on stdout.
- **Katana**: A next-generation crawling and spidering framework
- **Hakrawler**: Fast golang web crawler for gathering URLs and JavaScript file locations. This is basically a simple implementation of the awesome Gocolly library.
- **Gf**: A wrapper around grep to avoid typing common patterns.
- **Qsreplace**: Accept URLs on stdin, replace all query string values with a user-supplied value, only output each combination of query string parameters once per host and path.
- **Httpx**: Fast and multi-purpose HTTP toolkit that allows running multiple probes using the retryablehttp library. It is designed to maintain result reliability with an increased number of threads.
- **Httprobe**: Take a list of domains and probe for working http and https servers.
- **Anew**: Append lines from stdin to a file, but only if they don't already appear in the file. Outputs new lines to stdout too, making it a bit like a tee -a that removes duplicates.
- **Unfurl**: Pull out bits of URLs provided on stdin
- **Crtsh**: A Python utility to fetch or would say scrap subdomains from https://crt.sh
- **Dirsearch**: Web path discovery
- **Dirhunt**: Web crawler optimize for search and analyze directories.
- **Arjun**: HTTP Parameter Discovery Suite
- **Bhedak**: A replacement of qsreplace, accepts URLs as standard input, replaces all query string values with user-supplied values and stdout. Works on every OS. Made with python
- **Paramspider**: Mining URLs from dark corners of Web Archives for bug hunting/fuzzing/further probing
- **Urldedupe**: Tool to quickly pass in a list of URLs, and get back a list of deduplicated (unique) URL and query string combination.
- **LUcek**: toolkit for checks the status of URLs to see if they are alive or not.
- **Rustscan**: The Modern Port Scanner. Find ports quickly (3 seconds at its fastest). Run scripts through our scripting engine (Python, Lua, Shell supported).

## 🚀 Installation
Clone this repository and run the installation script:

```bash
git clone https://github.com/harrmahar/bugbounty-toolkit
```
```bash
cd bugbounty-toolkit
```
```bash
chmod +x install-toolkit-for-linux.sh
```
```bash
./install-toolkit-for-linux.sh
```