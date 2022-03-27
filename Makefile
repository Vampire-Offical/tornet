build:
	cp -v run_anon.py /usr/bin/run_anon.py
	cp -v test_anon.py /usr/bin/start_anon.py
	cp -v stop_anon.py /usr/bin/stop_anon.py
	cp anon /usr/bin/anon
dev:
	rm -rf anon
	valac --pkg gtk+-3.0 main.vala -o anon
	cp -v run_anon.py /usr/bin/run_anon.py
	cp -v test_anon.py /usr/bin/test_anon.py
	cp -v stop_anon.py /usr/bin/stop_anon.py