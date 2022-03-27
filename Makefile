build:
	cp -v run_anon.py /usr/lib/run_anon.py
	cp -v test_anon.py /usr/lib/start_anon.py
	cp -v stop_anon.py /usr/lib/stop_anon.py
	cp anon /usr/bin/anon
dev:
	rm -rf anon
	valac --pkg gtk+-3.0 main.vala -o anon