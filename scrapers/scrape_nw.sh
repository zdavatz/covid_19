#!/usr/bin/env python3

import scrape_common as sc

<<<<<<< HEAD
print('NW')
d = sc.download('https://www.nw.ch/gesundheitsamtdienste/6044')
sc.timestamp()
d = sc.filter(r'Stand:|Bisher (ist bei|sind)|Positiv getestete Personen:|Am Virus verstorbene Personen:', d)
=======
echo NW
d=$("${DIR}/download.sh" "https://www.nw.ch/gesundheitsamtdienste/6044" | egrep "Stand:|Bisher (ist bei|sind)|Positiv getestete Personen:|Am Virus verstorbene Personen:")  # " # To make my editor happy.
echo "Scraped at: $(date --iso-8601=seconds)"
>>>>>>> 89d2ad6a8adace67f815531130895325260b8075

# <p class="icmsPContent icms-wysiwyg-first"><em>Stand: 21.&nbsp;März 2020, 18.15&nbsp; Uhr</em></p>
# <p class="icmsPContent">Bisher ist bei 33&nbsp;Personen&nbsp;im Kanton Nidwalden das Coronavirus nachgewiesen worden.&nbsp;<a id="Veranstaltungen" name="Veranstaltungen"></a></p>

# <p class="icmsPContent icms-wysiwyg-first"><em>Stand: 24.&nbsp;März 2020, 15.15&nbsp;Uhr</em></p>
# <p class="icmsPContent">Bisher sind 42&nbsp;Personen&nbsp;im Kanton Nidwalden positiv auf das Coronavirus getestet worden.&nbsp;<a id="Veranstaltungen" name="Veranstaltungen"></a></p>

# 2020-03-25
"""
<p class="icmsPContent icms-wysiwyg-first"><em>Stand: 25.&nbsp;März 2020, 15.30 Uhr</em></p>
...
<p class="icmsPContent">Bisher sind 44&nbsp;Personen&nbsp;im Kanton Nidwalden positiv auf das Coronavirus getestet worden.&nbsp;<a id="Veranstaltungen" name="Veranstaltungen"></a></p>
"""

<<<<<<< HEAD
# 2020-03-26
"""
            <div class="icms-text-container"><div class="icms-wysiwyg"><h2 class="icmsH2Content"><strong>Aktuelle Situation Kanton Nidwalden</strong></h2>

<p class="icmsPContent icms-wysiwyg-first"><em>Stand: 25.&nbsp;März 2020, 15.30 Uhr</em></p>

 <h3 class="icmsH3Content"><br />
 <strong>Anzahl&nbsp;Erkrankungen/Tote</strong></h3>

 <p class="icmsPContent">Positiv getestete Personen: 44<br />
 Am Virus verstorbene Personen: 0&nbsp;<a id="Veranstaltungen" name="Veranstaltungen"></a></p>
"""

print('Date and time:', sc.find(r'em>Stand: *([^<]+)<\/em>', d))

a = sc.find(r'Bisher (ist bei|sind) ([0-9]+)(&nbsp;| )Pers', d, group=2)
b = sc.find(r'Positiv getestete Personen: ([0-9]+)<', d)
print('Confirmed cases:', a or b)

print('Deaths:', sc.find(r'Am Virus verstorbene Personen: ([0-9]+)[^0-9]', d))
=======

# 2020-03-26
#            <div class="icms-text-container"><div class="icms-wysiwyg"><h2 class="icmsH2Content"><strong>Aktuelle Situation Kanton Nidwalden</strong></h2>
#
#<p class="icmsPContent icms-wysiwyg-first"><em>Stand: 25.&nbsp;März 2020, 15.30 Uhr</em></p>

# <h3 class="icmsH3Content"><br />
# <strong>Anzahl&nbsp;Erkrankungen/Tote</strong></h3>

# <p class="icmsPContent">Positiv getestete Personen: 44<br />
# Am Virus verstorbene Personen: 0&nbsp;<a id="Veranstaltungen" name="Veranstaltungen"></a></p>


echo -n "Date and time: "
echo "$d" | grep "Stand:" | sed -E -e 's/^.*em>Stand: *([^<]+)<\/em>.*$/\1/'

echo -n "Confirmed cases: "
echo "$d" | egrep "Bisher (ist|sind)|Positiv getestete Personen:" | sed -E -e 's/^.*(ist bei|sind) ([0-9]+)(&nbsp;| )Pers.*$/\2/' -e 's/^.*Positiv getestete Personen: ([0-9]+)<.*$/\1/'

echo -n "Deaths: "
echo "$d" | egrep "Am Virus verstorbene Personen:" | sed -E -e 's/^.*Am Virus verstorbene Personen: ([0-9]+)[^0-9].*$/\1/'
>>>>>>> 89d2ad6a8adace67f815531130895325260b8075
