build:
	cp -v run_anon.py /usr/bin/run_anon.py
	cp -v test_anon.py /usr/bin/start_anon.py
	cp -v stop_anon.py /usr/bin/stop_anon.py
	cp anon /usr/bin/anon
dev:
	rm -rf /usr/bin/*_anon.py
	rm -rf anon
	valac --pkg gtk+-3.0 main.vala -o anon
	cp -v run_anon.py /usr/bin/run_anon.py
	cp -v test_anon.py /usr/bin/test_anon.py
	cp -v stop_anon.py /usr/bin/stop_anon.py
	cp -v chng_anon.py /usr/bin/chng_anon.py

clean:
	rm -rf /usr/bin/*_anon.py