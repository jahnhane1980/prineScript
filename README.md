# MISSION: Universal Sentinel Oracle (V32.0 - Adaptive Master Edition)

Dieses Dokument dient als technische Referenz für das Sentinel-System. Es kombiniert Makro-Analysen, adaptive Zyklen und institutionelle Datenflüsse zu einem deterministischen Entscheidungswerkzeug.

---

## 1. DIE LOGIK-ENGINE (DAS GEHIRN)
Das System passt sich dynamisch an das Marktverhalten an und berechnet Wahrscheinlichkeiten für Wendepunkte.
* **Adaptive WMA-Zyklen**: Berechnet die Zykluslänge über die letzten drei Perioden mit einer **3-2-1 Gewichtung**.
* **Translation-Analyse (LT/RT)**: Erkennt die Marktstruktur innerhalb eines Zyklus.
    * **Right Translated (RT)**: Bullisch. Peak liegt > 50% der Zeit. Signalisiert Trendstärke.
    * **Left Translated (LT)**: Bärisch. Peak liegt < 50% der Zeit. Warnung vor tieferen Tiefs.
* **Auto-Scaling**: Automatische Anpassung der Bar-Berechnungen an den gewählten Timeframe (2h bis Daily).

## 2. DIE MAKRO-EBENE (DAS UMFELD)
Ein Einstieg erfolgt nur, wenn das globale "Wetter" keine Systemrisiken anzeigt.
* **Liquidität**: Überwachung der Fed-Bilanz (WALCL) und des US-Dollars (DXY).
* **Volatilität**: Echtzeit-Check von VIX (Aktien) und MOVE (Anleihen).
* **Zins-Physik**: Überwachung der US-JP Carry-Differenz und der Realzinsen (TIPS).

## 3. SNIPER-PHYSIK & INSTITUTIONEN (DER HANDSHAKE)
Die Ausführung erfolgt streng nach den Parametern der V34-Logik.
* **Tranchen-System**: Fokus auf den **Strike T3 (70%)**, wenn der Preis das Bollinger Band 4SD innerhalb des Zyklus-Fensters berührt.
* **Dark Pool Proxy**: Identifikation von institutioneller Absorption (Lila Hintergrund). Zeigt an, wenn "Smart Money" heimlich Positionen aufbaut.

## 4. DAS VETO-SYSTEM (DIE SICHERHEIT)
Automatisierte Sperren verhindern Käufe in gefährlichen Marktphasen.
* **Falling Knife Veto**: Blockiert Signale, wenn die Fallgeschwindigkeit $> 2,2 \times$ ATR beträgt.
* **Miner-Stagnations-Check**: Veto, wenn das Underlying (z.B. Silber) steigt, die Minen-Aktie aber stagniert (Relative Schwäche).
* **Energy-Cost Veto**: Überwachung der Ölpreise (WTI) für die Profitabilität von Minen.

## 5. ASSET-KATEGORIEN & VERHALTENSLOGIK
Je nach gewählter Kategorie im Menü ändert das Skript seine DNA:

| Typ | Bezeichnung | Fokus-Indikator | Verhalten / Gewichtung |
| :--- | :--- | :--- | :--- |
| **A / B** | **Growth & Index** | Fed-Liq / Real Yields | Standard Predator: Tranchen 10/20/70. Fokus auf institutionelle Absorption. |
| **C** | **Crypto / BTC** | MVRV-Proxy / DXY | Hohe Sensitivität auf Dollar-Stärke. Zyklen auf ca. 40 Tage kalibriert. |
| **D** | **Miner (SILV/GDX)** | Inter-Market Div / WTI | **Leveraged Hunter**: Tranchen 5/15/80. Strenges Veto bei relativer Schwäche zum Metall. |
| **E** | **Momentum** | RelVol / EMA 8 | **Momentum Surfer**: 100% Slot-Größe. Einstieg nur bei RelVol > 150%. |
| **F** | **Bonds (TLT)** | MOVE-Index / US30Y | **Fixed Income Navigator**: Strike nur bei MOVE > 110 (Panik am Zinsmarkt). |

**Einstellung & Auswirkung:**
* Die Wahl der Kategorie beeinflusst die **Zykluslänge**, die **Veto-Sensitivität** und die **Alert-Bedingungen**.
* Ein falscher Typ (z.B. Typ D auf dem Nasdaq) führt zu falschen Veto-Meldungen (z.B. Silber-Divergenz-Warnung bei Aktien).

## 6. DIE ALERT-MATRIX (WANN KOMMEN DIE NACHRICHTEN?)
Wenn der Indikator in TradingView aktiv ist, sendet er in folgenden Szenarien eine Nachricht an die App:
1. **STRIKE T3 (Kauf)**: Zyklus-Boden, BB 4SD und Makro-Checks sind "Grün".
2. **LT-WARNING (Verkauf)**: Zyklus ist Left Translated (Peak zu früh) und bricht den EMA 8. **(bärisch)**.
3. **MOMENTUM STRIKE**: Info bei Typ E, wenn ein Volumen-Ausbruch über den EMA 8 stattfindet.
4. **VETO-MESSAGE**: Nachricht, wenn ein theoretischer Strike durch das System (z.B. Falling Knife) blockiert wurde.
5. **PEAK-INFO**: Statusmeldung zum aktuellen Peak: **(bullisch / RT)** oder **(bärisch / LT)** inkl. Prozentangabe.

---
*Dokument gepflegt von: Doku-Buddy Modus*
