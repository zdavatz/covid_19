#!/usr/bin/env python3

import scrape_common as sc

print('TG')
d = sc.download('https://www.tg.ch/news/fachdossier-coronavirus.html/10552')
sc.timestamp()
d = d.replace('&nbsp;', ' ')

# 2020-03-25
"""
      <li>Anzahl bestätigter Fälle: 96</li> 
     <p><em>Stand 25.3.20</em></p> 
"""

# 2020-04-03
"""
    <div class="box box--blue"> 
     <h2>Aktuelle Fallzahlen im Kanton Thurgau</h2> 
     <ul> 
      <li>Anzahl bestätigter Fälle: 198</li> 
      <li>davon&nbsp;5 verstorben</li> 
     </ul> 
     <p><em>Stand 3.4.20</em></p> 
    </div> 
"""

print('Date and time:', sc.find(r'Stand\s*([^<]+)<', d))
print('Confirmed cases:', sc.find(r'(?:Anzahl)?\s*bestätigter\s*Fälle:?\s*([0-9]+)\b', d))
print('Deaths:', sc.find(r'\b([0-9]+)\s*verstorb', d))
