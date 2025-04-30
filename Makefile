produce:
	git pull
	curl -o delegated-apnic-latest https://ftp.apnic.net/stats/apnic/delegated-apnic-latest
#	curl -o china_ip_list.txt https://raw.githubusercontent.com/misakaio/chnroutes2/refs/heads/master/chnroutes.txt
	curl -o china_ip_list.txt https://raw.githubusercontent.com/mayaxcn/china-ip-list/refs/heads/master/chnroute.txt
	sed -i '1,2d' china_ip_list.txt
	python3 produce.py --next tun0 --exclude ${PASS_IPS}
	echo -n "route 13.107.21.0/24 via \"tun0\"; \nroute 23.193.119.0/24 via \"tun0\"; \nroute 204.79.197.0/24 via \"tun0\";"  >> routes4.conf

#	python3 produce.py
#	sudo mv routes4.conf /etc/bird/routes4.conf
#	sudo mv routes6.conf /etc/bird/routes6.conf
#	sudo birdc configure
#	sudo birdc6 configure
