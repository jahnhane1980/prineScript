# MISSION: Universal Sentinel Oracle (V32.0 - Adaptive Master Edition)

Dieses Dokument beschreibt die vollständige Logik und Architektur des TradingView-Skripts, das Makro-Analysen, adaptive Zyklen und institutionelle Datenflüsse kombiniert.

---

## 1. DIE LOGIK-ENGINE (DAS GEHIRN)
Das System passt sich dynamisch an das Marktverhalten an und berechnet Wahrscheinlichkeiten für Wendepunkte.
* **Adaptive WMA-Zyklen**: Die Zykluslänge wird über die letzten drei abgeschlossenen Zyklen mit einer **3-2-1 Gewichtung** berechnet. Der aktuellste Zyklus hat das höchste Gewicht.
* **Translation-Analyse (LT/RT)**: Das System erkennt, ob ein Zyklus links- oder rechtslastig ist.
    * **Peak-Loc %**: Misst die Position des Hochs im Zyklus.
    * **Right Translated (RT)**: Bullisch. Peak liegt > 50% der Zeit.
    * **Left Translated (LT)**: Bärisch. Peak liegt < 50% der Zeit. Signalisiert einen "Exit"-Bedarf.
* **Auto-Scaling**: Mathematische Anpassung aller Berechnungen an den gewählten Timeframe (2h, 4h, Daily).

## 2. DIE MAKRO-EBENE (DAS UMFELD)
Ein Einstieg erfolgt nur, wenn das globale "Wetter" keine Systemrisiken anzeigt.
* **Liquidität**: Überwachung der Fed Total Assets (WALCL) und des US-Dollars (DXY).
* **Volatilität**: Echtzeit-Check von VIX (Aktien) und MOVE (Anleihen).
* **Zins-Physik**: Überwachung der US10Y/JP10Y Carry-Differenz und der Realzinsen (TIPS).

## 3. SNIPER-PHYSIK & INSTITUTIONEN (DER HANDSHAKE)
Die Ausführung erfolgt streng nach den Parametern der V34-Sniper-Logik.
* **Tranchen-System**: Fokus auf den **Strike T3 (70%)**, wenn der Preis das Bollinger Band 4SD innerhalb des Zeitfensters berührt.
* **Dark Pool Proxy**: Identifikation von institutioneller Absorption (Lila Hintergrund). Zeigt an, wenn "Smart Money" Positionen heimlich aufbaut.
* **Momentum (Typ E)**: Spezieller Ausbruchs-Filter mit Relativem Volumen > 150% und EMA 8 Bestätigung.

## 4. DAS VETO-SYSTEM (DIE SICHERHEIT)
Automatisierte Sperren verhindern Käufe in gefährlichen Marktphasen.
* **Falling Knife Veto**: Blockiert Signale, wenn die Fallgeschwindigkeit $> 2,2 \times$ ATR beträgt.
* **Miner-Stagnations-Check**: Veto, wenn das Underlying (z.B. Silber) steigt, die Minen-Aktie aber stagniert (Relative Schwäche).
    * *Zusatz-Label*: Empfehlung zur Gewinnmitnahme ("Partial Exit"), wenn Divergenz bei bestehenden Positionen auftritt.
* **Energy-Cost Veto**: Überwachung der Ölpreise (WTI) für die Profitabilität von Minen.
* **Bond-Panic Veto**: Verhindert TLT-Käufe bei zu niedriger Volatilität am Rentenmarkt (MOVE < 110).

## 5. DIE ALERT-MATRIX (WANN KOMMEN DIE NACHRICHTEN?)
Wenn der Indikator in TradingView aktiv ist, sendet er in folgenden Szenarien eine Nachricht an die App:
1. **STRIKE T3 (Kauf)**: Sofortige Nachricht, wenn Zyklus-Boden, BB 4SD und alle Makro-Checks gleichzeitig "Grün" zeigen.
2. **LT-WARNING (Verkauf)**: Kritische Nachricht, wenn der Zyklus nach der 50%-Marke unter den EMA 8 fällt und der Peak "links" (bärisch) lag.
3. **MOMENTUM STRIKE (Trade)**: Info bei Typ E Assets, wenn ein Volumen-Ausbruch über den EMA 8 stattfindet.
4. **VETO-MESSAGE (Info)**: Nachricht, wenn ein theoretischer Kauftermin durch das Veto-System (z.B. Falling Knife) blockiert wurde.
5. **DATA-LOG (CSV)**: Jede Nachricht enthält den Datensatz `Ticker;Preis;Peak-Pos;Score` für die Post-Mortem-Analyse in Tabellenkalkulationen.
